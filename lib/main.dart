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
    // double widthEvents = MediaQuery.of(context).size.width *0.6;
    return MaterialApp(
      title: 'HS Albsig Studi-Cafe',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromRGBO(0xD4, 0xA3, 0x73, 100)),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
