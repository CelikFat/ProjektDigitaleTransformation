import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart' as google_fonts;
import 'package:studi_cafe/Info/info_mobile.dart';
import 'package:studi_cafe/Raumbuchung/room_overview.dart';
import 'package:studi_cafe/contact_page/contact_page.dart';
import 'package:studi_cafe/footerbar.dart';
import 'package:studi_cafe/home_page/home_page.dart';
import 'package:studi_cafe/navbar_desktop.dart';

class HomePageDesktop extends StatelessWidget {
  const HomePageDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverPersistentHeader(
            pinned: true,
            delegate: StickyNavbarDelegate(
              child: const NavbarDesktop(),
            ),
          ),
        ],
        body: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/homepage/experimental_background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.25,
                ),
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 50),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.25,
                          decoration: BoxDecoration(
                            color: const Color(0xFFD98E44),
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: Colors.white,
                              width: 8.0,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Willkommen im Studi-Cafe",
                              style: google_fonts.GoogleFonts.dancingScript(
                                fontSize: 50,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.transparent, width: 20),
                          ),
                          child: Image.asset(
                            'assets/logo/app_logo.png',
                            width: 200,
                            height: 200,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          height: 100,
                          decoration: BoxDecoration(
                            color: const Color(0xFFD98E44),
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: Colors.white,
                              width: 8.0,
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              "Unsere Mission: ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                fontStyle: FontStyle.italic,
                                wordSpacing: 2.0,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                          child: const Center(
                            child: Text(
                              InfoPageMobile.betriebsKonzept,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                        Container(
                          height: 100,
                          decoration: BoxDecoration(
                            color: const Color(0xFFD98E44),
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: Colors.white,
                              width: 8.0,
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              "Unsere Öffnungszeiten: ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                fontStyle: FontStyle.italic,
                                wordSpacing: 2.0,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.22,
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,                            
                            children: [
                              ListTile(
                                leading: Icon(
                                  Icons.favorite,
                                  color: Colors.orange,
                                ),
                                title: Text(
                                  "Montag: 8 - 17 Uhr",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              ListTile(
                                leading: Icon(
                                  Icons.favorite,
                                  color: Colors.orange,
                                ),
                                title: Text(
                                  "Dienstag: 8 - 18 Uhr",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              ListTile(
                                leading: Icon(
                                  Icons.favorite,
                                  color: Colors.orange,
                                ),
                                title: Text(
                                  "Mittwoch: 8 - 18 Uhr",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              ListTile(
                                leading: Icon(
                                  Icons.favorite,
                                  color: Colors.orange,
                                ),
                                title: Text(
                                  "Donnerstag: 8 - 18 Uhr",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              ListTile(
                                leading: Icon(
                                  Icons.favorite,
                                  color: Colors.orange,
                                ),
                                title: Text(
                                  "Freitag: 8 - 20 Uhr",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              ListTile(
                                leading: Icon(
                                  Icons.favorite,
                                  color: Colors.orange,
                                ),
                                title: Text(
                                  "Samstag: 8 - 15 Uhr",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              ListTile(
                                leading: Icon(
                                  Icons.favorite,
                                  color: Colors.orange,
                                ),
                                title: Text(
                                  "Sonntag: 10 - 15 Uhr",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 40),
                        Container(
                          height: 100,
                          decoration: BoxDecoration(
                            color: const Color(0xFFD98E44),
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: Colors.white,
                              width: 8.0,
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              "So finden Sie uns: ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                fontStyle: FontStyle.italic,
                                wordSpacing: 2.0,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        InkWell(
                          onTap: () {
                            // Handle navigation to ContactPage
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ContactPage(),
                              ),
                            );
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'einmal hier klicken!',
                                style: TextStyle(
                                  color: Colors.orange,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          height: 100,
                          decoration: BoxDecoration(
                            color: const Color(0xFFD98E44),
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: Colors.white,
                              width: 8.0,
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              "Zur Raumbuchung hier: ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                fontStyle: FontStyle.italic,
                                wordSpacing: 2.0,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        InkWell(
                          onTap: () {
                            // Handle navigation to ContactPage
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RoomBookingPage(),
                              ),
                            );
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'einmal hier klicken!',
                                style: TextStyle(
                                  color: Colors.orange,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.25,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const FooterBar(),
    );
  }
}