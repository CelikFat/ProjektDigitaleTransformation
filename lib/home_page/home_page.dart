import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart' as google_fonts;

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(  
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFD98E44),
              borderRadius: BorderRadius.circular(10.0), // Optional: Add border radius for rounded corners
              border: Border.all(
                color: Colors.white, // White border color
                width: 8.0, // Adjust the width of the border
              ),
            ),
            
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.4,
            margin: const EdgeInsets.fromLTRB(0, 50, 0, 50),
            child: Center(
              child: Text (
                "Willkommen im Studi-Cafe",
                style: google_fonts.GoogleFonts.dancingScript(
                  fontSize: 40,
                ),
              ),
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