import 'package:flutter/material.dart';
import 'package:studi_cafe/food_menu/menu.dart';
import 'package:studi_cafe/home_page/home_page.dart';
import 'package:studi_cafe/main.dart';

class appSidebar extends StatefulWidget {
  const appSidebar({super.key});

  @override
  State<appSidebar> createState() => appSidebarState();
}

class appSidebarState extends State<appSidebar> {
  Widget page = HomePage();
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                  page = MyApp();
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
                  page = MenuPage();
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
  );}
}