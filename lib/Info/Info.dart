import 'package:flutter/material.dart';
import 'package:studi_cafe/footerbar.dart';
import 'package:studi_cafe/headerbar.dart';
import 'package:studi_cafe/sidebar.dart';
import 'package:studi_cafe/Info/info_list.dart';

class MyExpansionPanel extends StatefulWidget {
  const MyExpansionPanel({Key? key});

  @override
  _MyExpansionPanelState createState() => _MyExpansionPanelState();
}


class InfoPage extends StatelessWidget {
  const InfoPage({Key? key});

  @override
  Widget build(BuildContext context) {
    String betriebsKonzept = 'Unser StudiCafé ist ein einladender Ort, an dem Studierendeunterschiedlicher Fachrichtungen zusammenkommen, lernen und sichaustauschen können. Mit einem Fokus auf eine inspirierende Atmosphäre und Lernraummöglichkeiten möchten wir die Aufenthaltsqualität für Studierende verbessern und eine Plattform für Vernetzung und Austausch schaffen. Durch die Kooperation mit der Hochschule, Studierendenwerk, IHK, VDI, der lokalen Gemeinschaft und Unternehmen wollen wir das Studierenden Café zu einem integralen Bestandteil des Hochschullebens machen und die Studierendenbedingungen nachhaltig verbessern.'; // Hier dein Text

    return Scaffold(
      backgroundColor: const Color.fromRGBO(0xD4, 0xA3, 0x73, 100),
      appBar: const HeaderBar(),
      drawer: const AppSidebar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
              height: 80,
              child: const Center(
                child: Text(
                  'Infos',
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
              decoration: const BoxDecoration(
                color: Color(0xFFD98E44),
            
              ),
              width: double.infinity,
              height: 200,
              child: Center(
                child: Text(
                  betriebsKonzept,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
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
                borderRadius: BorderRadius.circular(10.0), // Optional: Add border radius for rounded corners
                border: Border.all(
                  color: Colors.white, // White border color
                  width: 8.0, // Adjust the width of the border
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
            const SizedBox(height: 16.0), // Füge etwas Platz zwischen der Karte und dem Bild hinzu
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(0xD4, 0xA3, 0x73, 100),
                borderRadius: BorderRadius.circular(10.0), // Optional: Add border radius for rounded corners
                border: Border.all(
                  color: Colors.white, // White border color
                  width: 4.0, // Adjust the width of the border
                ),
              ),
              child: Image.asset(
                'assets/images/Mapsausschnitt.png', // Passe den Pfad zum Bild an
                 width: 400,
                  height: 400, // Passe die Anzeigeeinstellungen nach Bedarf an
              ),
              
            ),
            MyExpansionPanel(), // Hier keine Probleme mehr mit MyExpansionPanel
          ],
        ),
      ),
      bottomNavigationBar: const FooterBar(),
    );
  }
}

class _MyExpansionPanelState extends State<MyExpansionPanel> {
  late Future<List<Item>> _data;

  @override
  void initState() {
    super.initState();
    _data = fetchItemsFromFirebase();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Item>>(
      future: _data,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Fehler beim Laden der Daten: ${snapshot.error}');
        } else {
          return SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: ExpansionPanelList(
                expansionCallback: (int index, bool isExpanded) {
                  setState(() {
                    snapshot.data![index].isExpanded = !isExpanded;
                  });
                },
                children: snapshot.data!.map<ExpansionPanel>((Item item) {
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
      },
    );
  }
}