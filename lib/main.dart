import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:studi_cafe/home_page/home_page.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const StudiCafeApp());
}

class StudiCafeApp extends StatelessWidget {
  const StudiCafeApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'HS Albsig Studi-Cafe',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

Future<void> uploadImageToFirebase(File imageFile, String imageName) async {
  try {
    // Firebase Storage
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference storageReference = storage.ref().child('images/$imageName');
    UploadTask uploadTask = storageReference.putFile(imageFile);
    TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
    
    // Download URL des hochgeladenen Bildes
    String downloadUrl = await taskSnapshot.ref.getDownloadURL();

    // Firebase Firestore
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    
    // Fügen Sie den Download-URL zum Firestore hinzu
    await firestore.collection('Event').doc('IhreEventID').collection('EventBild').doc('IhreBildID').set({
      'BildURL': downloadUrl,
      // Weitere Felder können hier hinzugefügt werden
    });
    
    print('Bild erfolgreich hochgeladen und in der Datenbank gespeichert. Download-URL: $downloadUrl');
  } catch (e) {
    print('Fehler beim Hochladen und Speichern des Bildes: $e');
  }
}
File imageFile = File('C:\Users\domin\OneDrive\Dokumente\Dominik\Studium\Sem5\Proj. Digit. Trans. Stud. Cafe\Github\ProjektDigitaleTransformation\assets\images\Vortrag.webp');
String imageName = 'Vortrag.web';
String eventId = '1'; // Ersetzen Sie dies durch die tatsächliche Event-ID
String imageId = '1'; // Ersetzen Sie dies durch die tatsächliche Bild-ID

//await uploadImageToFirebase(imageFile, imageName, eventId, imageId);