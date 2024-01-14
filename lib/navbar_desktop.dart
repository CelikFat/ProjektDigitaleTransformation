import 'package:flutter/material.dart';

class NavbarDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(0xD4, 0xA3, 0x73, 100), // Change to your desired color
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          //Image.asset('assets/logo/app_logo_klein.png'),
          Image.asset(
            'assets/logo/app_logo_klein.png', // Replace with your logo image path
            width: 50,
            height: 100,
          ),
          const Text(
            'StudiCafe',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 20),
          const _NavBarItem(icon: Icons.home, title: 'Home'),
          const _NavBarItem(icon: Icons.event, title: 'Raumbuchung'),
          const _NavBarItem(icon: Icons.restaurant_menu, title: 'Speisekarte'),
          const _NavBarItem(icon: Icons.event_note, title: 'Events'),
          const _NavBarItem(icon: Icons.info, title: 'Info'),
          const _NavBarItem(icon: Icons.contact_phone, title: 'Kontakt'),
        ],
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const _NavBarItem({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.white),
        const SizedBox(width: 5),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 20),
      ],
    );
  }
}