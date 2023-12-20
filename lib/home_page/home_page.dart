import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart' as google_fonts;
import 'package:studi_cafe/footerbar.dart';
import 'package:studi_cafe/headerbar.dart';
import 'package:studi_cafe/home_page/sponsors_list_file.dart';
import 'package:studi_cafe/sidebar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0xD4, 0xA3, 0x73, 100),
      appBar: const HeaderBar(),
      drawer: const AppSidebar(),
      body: homePageBuilder(context),
      bottomNavigationBar: const FooterBar(),
    );
  }

  Container homePageBuilder(BuildContext context) {
    return Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/homepage/experimental_background.jpg'), // Replace with your image asset path
        fit: BoxFit.cover, // Adjust the fit as needed
      ),
    ),
    child: SingleChildScrollView(
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
              margin: const EdgeInsets.fromLTRB(0, 100, 0, 100),
              child: const Center(
                child: Text (
                  "Willkommen im Studi-Cafe",
                 // style: google_fonts.GoogleFonts.dancingScript(
                   // fontSize: 40,
                 // ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFD98E44),
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: Colors.white,
                  width: 8.0,
                ),
              ),
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 100),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: sponsors.map((sponsor) {
                        return Container(
                          padding: const EdgeInsets.all(16.0),
                          child: const Icon(
                            Icons.favorite,
                            color: Colors.white,
                          ),
                        );
                      }).toList(),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: sponsors.map((sponsor) {
                        return Container(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            sponsor,
                           // style: google_fonts.GoogleFonts.playfairDisplay(
                             // fontSize: 16.0,
                            ),
                          //),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),         
          ],
        ),
      ),
    ),
  );
  }
}