import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(  
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text (
            "Willkommen im Studi-Cafe",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Text (
            'unsere Sponsoren:',
          ),    
          SizedBox(height: 30),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(onPressed: null, child: Text('KSK')),
              ElevatedButton(onPressed: null, child: Text('SIA')),
            ],
          ),
          
        ],
      ),
    );
  }
}