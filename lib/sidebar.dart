import 'package:flutter/material.dart';
import 'package:studi_cafe/food_menu/menu.dart';
import 'package:studi_cafe/home_page/home_page.dart';

class appSidebar extends StatefulWidget {
  const appSidebar({super.key});

  @override
  State<appSidebar> createState() => appSidebarState();
}

class appSidebarState extends State<appSidebar> {
  Widget page = MenuPage();
  int selectedIndex = 0;

  final List<Widget> widgetOptions = <Widget>[
    Expanded(child: HomePage()),
    Expanded(child: MenuPage()),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    //widget.onItemTapped(index); // Notify the parent about the index change
    Navigator.pop(context); // Close the drawer
  }

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
            selected: selectedIndex == 0,
            onTap: () {
              // Update the state of the app
              _onItemTapped(0);
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
            selected: selectedIndex == 0,
            onTap: () {
              // Update the state of the app
              _onItemTapped(1);
              // Then close the drawer
              Navigator.pop(context);
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
  }
}