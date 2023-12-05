// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:studi_cafe/Events/event.dart';
import 'package:studi_cafe/appBar.dart';
import 'package:studi_cafe/footer.dart';
import 'package:studi_cafe/sidebar.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // double widthEvents = MediaQuery.of(context).size.width *0.6;
    return MaterialApp(
      title: 'HS Albsig Studi-Cafe',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromRGBO(0xD4, 0xA3, 0x73, 100)),
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
      appBar: appAppBar,
      
      drawer: appSidebar,
        
      body: appListview,

        /*Center(
        child:
        Column(  
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text (
              "Willkommen im Studi-Cafe",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text (
              'unsere Sponsoren:',
            ),    
            SizedBox(height: 30),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(onPressed: null, child: Text('KSK')),
                ElevatedButton(onPressed: null, child: Text('SIA')),
              ],
            ),
            
          ],
        ),
      ),
      */

    bottomNavigationBar: appFooter,
    );
  }
}
