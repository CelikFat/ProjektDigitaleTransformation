import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:studi_cafe/home_page/home_page.dart';
import 'firebase_options.dart';


void main() async {
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
