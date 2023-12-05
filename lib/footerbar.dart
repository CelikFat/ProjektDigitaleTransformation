import 'package:flutter/material.dart';

class FooterBar extends StatelessWidget {
  const FooterBar({super.key});
  
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
    height: 45,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            TextButton(
              onPressed: () {
                // Aktion für Impressum
              },
              child: const Text('Impressum'),
            ),
            TextButton(
              onPressed: () {
                // Aktion für AGB
              },
              child: const Text('AGB'),
            ),
            TextButton(
              onPressed: () {
                // Aktion für Datenschutz
              },
              child: const Text('Datenschutz'),
            ),
            TextButton(
              onPressed: () {
                // Aktion für Über uns
              },
              child: const Text('Über uns'),
            ),
          ],
        ),
    );
  }
}
