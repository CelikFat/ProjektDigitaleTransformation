import 'package:flutter/material.dart';

var appSidebar = Drawer(
  backgroundColor: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(0x43, 0x28, 0x18, 25),
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
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                onTap: () {
                  // Aktion bei Klick auf "Info"
                },
              ),
              ListTile(
                leading: const Icon(Icons.meeting_room_outlined),
                title: const Text('Räume'),
                onTap: () {
                  // Aktion bei Klick auf "Info"
                },
              ),
              ListTile(
                leading: const Icon(Icons.restaurant_menu),
                title: const Text('Menü'),
                onTap: () {
                  // Aktion bei Klick auf "Räume"
                },
              ),
              ListTile(
                leading: const Icon(Icons.event),
                title: const Text('Events'),
                onTap: () {
                  // Aktion bei Klick auf "Kontakt"
                },
              ),
              ListTile(
                leading: const Icon(Icons.info_outline),
                title: const Text('Info'),
                onTap: () {
                  // Aktion bei Klick auf "Räume"
                },
              ),
              ListTile(
                leading: const Icon(Icons.contacts),
                title: const Text('Kontakt'),
                onTap: () {
                  // Aktion bei Klick auf "Räume"
                },
              ),
            ],
          ),
);