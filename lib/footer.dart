import 'package:flutter/material.dart';

var appFooter = BottomAppBar(
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
          ),
);