import 'package:flutter/material.dart';
import 'package:studi_cafe/Events/event.dart';
import 'package:studi_cafe/Info/info.dart';
import 'package:studi_cafe/Raumbuchung/raum%C3%BCbersicht.dart';
import 'package:studi_cafe/contact_page/contact_page.dart';
import 'package:studi_cafe/food_menu/menu.dart';
import 'package:studi_cafe/home_page/home_page.dart';

class AppSidebar extends StatefulWidget {
  const AppSidebar({super.key});

  @override
  State<AppSidebar> createState() => AppSidebarState();
}

class AppSidebarState extends State<AppSidebar> {
  final List<Widget> widgetOptions = <Widget>[
    const HomePage(),
    const RoomBookingPage(),
    const MenuPage(),
    const EventPage(),
    const InfoPage(),
    const ContactPage(),
  ];

  void onItemTapped(BuildContext context, int index) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => widgetOptions[index],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromRGBO(0x43, 0x28, 0x18, 25),
              ),
              child: Center(
                child: Text( 
                  'Menü',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () => onItemTapped(context, 0),
            ),
            ListTile(
              leading: const Icon(Icons.meeting_room_outlined),
              title: const Text('Räume'),
              onTap: () => onItemTapped(context, 1),
            ),
            ListTile(
              leading: const Icon(Icons.restaurant_menu),
              title: const Text('Menü'),
              onTap: () => onItemTapped(context, 2),
            ),
            ListTile(
              leading: const Icon(Icons.event),
              title: const Text('Events'),
              onTap: () => onItemTapped(context, 3),
            ),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('Info'),
              onTap: () => onItemTapped(context, 4),
            ),
            ListTile(
              leading: const Icon(Icons.contacts),
              title: const Text('Kontakt'),
              onTap: () => onItemTapped(context, 5),
            ),
          ],
        ),
      ),
    );
  }
}
