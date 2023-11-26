import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart' as google_fonts;
import 'package:studi_cafe/home_page/sponsors_list_file.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
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
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFD98E44),
                borderRadius: BorderRadius.circular(10.0), // Optional: Add border radius for rounded corners
                border: Border.all(
                  color: Colors.white, // White border color
                  width: 8.0, // Adjust the width of the border
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch, 
                  children: [
                    Container(
                      padding: EdgeInsets.all(16.0),
                      child: Center(
                        child: Text(
                          'Unsere Sponsoren/Partner:',
                          style: google_fonts.GoogleFonts.playfairDisplay(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    ...sponsors.map((sponsor) {
                      return Container(
                        padding: EdgeInsets.fromLTRB(260, 16, 260, 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.favorite,
                              color: Colors.white,
                            ),
                            SizedBox(width: 8.0),
                            Text(
                              sponsor,
                              style: google_fonts.GoogleFonts.playfairDisplay(
                                fontSize: 16.0
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ],
                ),
              ),
            ),          
          ],
        ),
      ),
    );
  }
}