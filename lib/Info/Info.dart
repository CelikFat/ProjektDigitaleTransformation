

import 'package:flutter/material.dart';
import 'package:studi_cafe/footerbar.dart';
import 'package:studi_cafe/headerbar.dart';
import 'package:studi_cafe/sidebar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     String Betriebskonzept = 'Unser StudiCafé ist ein einladender Ort, an dem Studierendeunterschiedlicher Fachrichtungen zusammenkommen, lernen und sichaustauschen können. Mit einem Fokus auf eine inspirierende Atmosphäre und Lernraummöglichkeiten möchten wir die Aufenthaltsqualität für Studierende verbessern und eine Plattform für Vernetzung und Austausch schaffen. Durch die Kooperation mit der Hochschule, Studierendenwerk, IHK, VDI, der lokalen Gemeinschaft und Unternehmen wollen wir das Studierenden Café zu einem integralen Bestandteil des Hochschullebens machen und die Studierendenbedingungen nachhaltig verbessern.';
   return Scaffold (
      backgroundColor: const Color.fromRGBO(0xD4, 0xA3, 0x73, 100),
      appBar: const HeaderBar(),
      drawer: const AppSidebar(),
      body: 
      SingleChildScrollView(
        child: Column (
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
              child: Center(
                child: Text(
                  'InfoSeite',
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
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: const Color(0xFFD98E44),
            
              ),
              width: double.infinity,
              height: 200,
              child: Center(
                child: Text(
                  Betriebskonzept,
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
                borderRadius: BorderRadius.circular(10.0), // Optional: Add border radius for rounded corners
                border: Border.all(
                  color: Colors.white, // White border color
                  width: 8.0, // Adjust the width of the border
                ),
              ),
              width: double.infinity,
              height: 80,
              child: Center(
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
            /*Container(
              height: 200, // Setze die Höhe des Google Maps-Widgets nach Bedarf
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(37.7749, -122.4194), // Setze die Startposition nach Bedarf
                  zoom: 12.0,
                ),
                markers: {
                  Marker(
                    markerId: MarkerId('markerId'),
                    position: LatLng(37.7749, -122.4194), // Setze die Marker-Position nach Bedarf
                    infoWindow: InfoWindow(
                      title: 'Google Maps Marker',
                    ),
                  ),
                },
              ),
            ), */
            SizedBox(height: 16.0), // Füge etwas Platz zwischen der Karte und dem Bild hinzu
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromRGBO(0xD4, 0xA3, 0x73, 100),
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
            SizedBox(height: 16.0),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFD98E44),
                borderRadius: BorderRadius.circular(10.0), // Optional: Add border radius for rounded corners
                border: Border.all(
                  color: Colors.white, // White border color
                  width: 6, // Adjust the width of the border
                ),
              ),
              width: double.infinity,
              height:80,
              child: Center(
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
            MyExpansionPanel(),
          ],
      ),
      ),
      bottomNavigationBar: const FooterBar(),
    );
  }
}

class MyExpansionPanel extends StatefulWidget {
  @override
  _MyExpansionPanelState createState() => _MyExpansionPanelState();
}

class _MyExpansionPanelState extends State<MyExpansionPanel> {
  List<Item> _data = generateItems();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(16.0),
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

class Item {
  Item({
    required this.question,
    required this.answer,
    this.isExpanded = false,
  });

  String question;
  String answer;
  bool isExpanded;
}

List<Item> generateItems() {
  return [
    Item(
      question: 'Wo finde ich das Studiencafe?',
      answer: 'Du findest das Studiencafe in der Vorstadt',
    ),
    Item(
      question: 'Gibt es auch Kaffee im Studiencafe?',
      answer: 'Jawohl! Es gibt super leckeren Kaffee :)',
    ),
    // Füge hier weitere Fragen und Antworten hinzu
  ];
}