// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

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
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0xD4, 0xA3, 0x73, 100),
        title: Text(widget.title),
      ),
      drawer: Drawer(
          // Navigation Drawer
          backgroundColor: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(0x43, 0x28, 0x18, 25),
                ),
                child: Text(
                  'Menüblabla',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () {
                  // Aktion bei Klick auf "Info"
                  Navigator.pop(context); // Schließt den Drawer
                },
              ),
              ListTile(
                leading: Icon(Icons.meeting_room_outlined),
                title: Text('Räume'),
                onTap: () {
                  // Aktion bei Klick auf "Info"
                  Navigator.pop(context); // Schließt den Drawer
                },
              ),
              ListTile(
                leading: Icon(Icons.restaurant_menu),
                title: Text('Menü'),
                onTap: () {
                  // Aktion bei Klick auf "Räume"
                  Navigator.pop(context); // Schließt den Drawer
                },
              ),
              ListTile(
                leading: Icon(Icons.event),
                title: Text('Events'),
                onTap: () {
                  // Aktion bei Klick auf "Kontakt"
                  Navigator.pop(context); // Schließt den Drawer
                },
              ),
              ListTile(
                leading: Icon(Icons.info_outline),
                title: Text('Info'),
                onTap: () {
                  // Aktion bei Klick auf "Räume"
                  Navigator.pop(context); // Schließt den Drawer
                },
              ),
              ListTile(
                leading: Icon(Icons.contacts),
                title: Text('Kontakt'),
                onTap: () {
                  // Aktion bei Klick auf "Räume"
                  Navigator.pop(context); // Schließt den Drawer
                },
              ),
            ],
          ),
        ),

        
      body: Center(
        child:
        Column(  
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


      bottomNavigationBar: BottomAppBar(
        height: 45,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TextButton(
                onPressed: () {
                  // Aktion für Impressum
                },
                child: Text('Impressum'),
              ),
              TextButton(
                onPressed: () {
                  // Aktion für AGB
                },
                child: Text('AGB'),
              ),
              TextButton(
                onPressed: () {
                  // Aktion für Datenschutz
                },
                child: Text('Datenschutz'),
              ),
              TextButton(
                onPressed: () {
                  // Aktion für Über uns
                },
                child: Text('Über uns'),
              ),
            ],
          ), // Ende Child
        ), //Ende Footer
    );
  }
}
