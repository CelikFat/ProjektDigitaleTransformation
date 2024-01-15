import 'package:flutter/material.dart';
import 'package:studi_cafe/Info/info_mobile.dart';
import 'package:studi_cafe/Info/info_list.dart';
import 'package:studi_cafe/footerbar.dart';
import 'package:studi_cafe/navbar_desktop.dart';

class InfoPageDesktop extends StatelessWidget {
  const InfoPageDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0xD4, 0xA3, 0x73, 100),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFD98E44),
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: Colors.white,
                    width: 8.0,
                  ),
                ),
                width: double.infinity,
                height: 80,
                child: const Center(
                  child: Text(
                    'Contact Page',
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
                padding: const EdgeInsets.all(16.0),
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.25,
                child: const Center(
                  child: Text(
                    InfoPageMobile.betriebsKonzept,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
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
                    width: 8.0,
                  ),
                ),
                width: double.infinity,
                height: 80,
                child: const Center(
                  child: Text(
                    'Hier findest du uns :D',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      wordSpacing: 2.0,
                    ),
                  ),
                ),
              ),
              // Uncomment the Google Maps container if needed
              /*
              Container(
                height: 200,
                child: GoogleMap(
                  // ... your Google Maps configuration
                ),
              ),
              */
              const SizedBox(height: 16.0),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(0xD4, 0xA3, 0x73, 100),
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: Colors.white,
                    width: 4.0,
                  ),
                ),
                child: Image.asset(
                  'assets/images/Mapsausschnitt.png',
                  width: 400,
                  height: 400,
                ),
              ),
              const SizedBox(height: 16.0),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFD98E44),
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: Colors.white,
                    width: 6,
                  ),
                ),
                width: double.infinity,
                height: 80,
                child: const Center(
                  child: Text(
                    'Du hast ein paar Fragen?',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      wordSpacing: 2.0,
                    ),
                  ),
                ),
              ),
              const MyExpansionPanel(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const FooterBar(),
    );
  }
}

class MyExpansionPanel extends StatefulWidget {
  const MyExpansionPanel({super.key});

  @override
  State<MyExpansionPanel> createState() => _MyExpansionPanelState();
}

class _MyExpansionPanelState extends State<MyExpansionPanel> {
  final List<Item> _data = generateItems();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: ExpansionPanelList(
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              _data[index].isExpanded = !isExpanded;
            });
          },
          children: _data.map<ExpansionPanel>((Item item) {
            return ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      item.isExpanded = !isExpanded;
                    });
                  },
                  child: ListTile(
                    title: Text(item.question),
                  ),
                );
              },
              body: ListTile(
                title: Text(item.answer),
              ),
              isExpanded: item.isExpanded,
            );
          }).toList(),
        ),
      ),
    );
  }
}
