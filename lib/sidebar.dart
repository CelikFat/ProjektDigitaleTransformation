import 'package:flutter/material.dart';

var appSidebar = Drawer(
  backgroundColor: Colors.white,
  child: ListView(
    padding: EdgeInsets.zero,
    children: <Widget>[
      DrawerHeader(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(0x43, 0x28, 0x18, 25),
        ),
        child: Text(
          'Menü',
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
        },
      ),
      ListTile(
        leading: Icon(Icons.meeting_room_outlined),
        title: Text('Räume'),
        onTap: () {
          // Aktion bei Klick auf "Info"
        },
      ),
      ListTile(
        leading: Icon(Icons.restaurant_menu),
        title: Text('Menü'),
        onTap: () {
          // Aktion bei Klick auf "Räume"
        },
      ),
      ListTile(
        leading: Icon(Icons.event),
        title: Text('Events'),
        onTap: () {
          // Aktion bei Klick auf "Kontakt"
        },
      ),
      ListTile(
        leading: Icon(Icons.info_outline),
        title: Text('Info'),
        onTap: () {
          // Aktion bei Klick auf "Räume"
        },
      ),
      ListTile(
        leading: Icon(Icons.contacts),
        title: Text('Kontakt'),
        onTap: () {
          // Aktion bei Klick auf "Räume"
        },
      ),
    ],
  ),
);
