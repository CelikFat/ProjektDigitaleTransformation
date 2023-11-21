// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:studi_cafe/footer.dart';
import 'package:studi_cafe/sidebar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HS Albsig Studi-Cafe',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Color.fromRGBO(0xD4, 0xA3, 0x73, 100)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Color.fromRGBO(0xFF, 0xE6, 0xA7, 100),
      // Color.fromRGBO(0xD4, 0xA3, 0x73, 100),
      // Color.fromRGBO(0xBB, 0x94, 0x57, 100),
      backgroundColor: Color.fromRGBO(0xD4, 0xA3, 0x73, 100),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0xD4, 0xA3, 0x73, 100),
        title: Text(widget.title),
      ),

      drawer: appSidebar,

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Hauptteil',
            ),
            Text(
              '0',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),

      bottomNavigationBar: appFooter,
    );
  }
}
