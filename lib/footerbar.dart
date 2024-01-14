import 'package:flutter/material.dart';

class FooterBar extends StatelessWidget {
  const FooterBar({super.key});
  
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: const Color.fromRGBO(0xD4, 0xA3, 0x73, 100),
      height: 45,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          TextButton(
            onPressed: () {
              // Aktion für Impressum
            },
            child: const Text(
              'Impressum',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              // Aktion für AGB
            },
            child: const Text(
              'AGB',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),  
            ),
          ),
          TextButton(
            onPressed: () {
              // Aktion für Datenschutz
            },
            child: const Text(
              'Datenschutz',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              // Aktion für Über uns
            },
            child: const Text(
              'Über uns',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),  
            ),
          ),
        ],
      ),
    );
  }
}
