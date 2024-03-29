import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart' as google_fonts;
import 'package:studi_cafe/footerbar.dart';
import 'package:studi_cafe/headerbar.dart';
import 'package:studi_cafe/home_page/datenbankverbindung.dart';
import 'package:studi_cafe/home_page/sponsor_list.dart';
import 'package:studi_cafe/sidebar.dart';

class HomePageMobile extends StatefulWidget {
  const HomePageMobile({super.key});

  @override
  HomePageMobileState createState() => HomePageMobileState();
}

class HomePageMobileState extends State<HomePageMobile> { 
  late DatabaseStream _databaseStream;

  @override
  void initState() {
    super.initState();
    _databaseStream = DatabaseStream(
      onDataLoaded: () {
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0xD4, 0xA3, 0x73, 100),
      appBar: const HeaderBar(),
      drawer: const AppSidebar(),
      body: homePageMobileBuilder(context),
      bottomNavigationBar: const FooterBar(),
    );
  }

  Widget homePageMobileBuilder(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/homepage/experimental_background.jpg'),
          fit: BoxFit.cover,
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
                  child: Text(
                    '"Willkommen im Studi-Cafe"',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      fontStyle: FontStyle.italic,
                      wordSpacing: 2.0,
                    ),
                  ),
                ),
              ),
              
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFD98E44),
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: Colors.white,
                    width: 4.0,
                  ),
                ),
                height: MediaQuery.of(context).size.height * 0.4,
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 100),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                  child: 
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: _databaseStream.sponsorListe.map((Sponsor currentSponsor) {
                          return Container(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center, 
                              children: [
                                ListTile(
                                  leading: const Icon(
                                    Icons.favorite,
                                    color: Colors.white,
                                  ),
                                  title: Text(
                                    currentSponsor.name,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
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