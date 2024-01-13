import 'package:flutter/material.dart';
import 'package:studi_cafe/Raumbuchung/Kunde.dart';
import 'package:intl/intl.dart';
import 'package:studi_cafe/footerbar.dart';
import 'package:studi_cafe/headerbar.dart';
import 'package:studi_cafe/home_page/home_page.dart';
import 'package:studi_cafe/sidebar.dart';

class ThankYouPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HeaderBar(),
      drawer: const AppSidebar(),
      bottomNavigationBar: const FooterBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Vielen Dank für deine Buchung! Du erhältst eine Bestätigung per Mail.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              Text(
                'Du kannst nun wieder zurück zur Homepage :)',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                child: Text('zurück zur Homepage'),
                onPressed: () {const HomePage();},
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  Map<String, dynamic> savedData = await Kunde.getData();
                  DateTime savedDate = DateTime.parse(savedData['selectedDay']);
                  String formattedDate =
                      DateFormat('yyyy-MM-dd').format(savedDate);
                  // Anzeigen der Daten
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Gespeicherte Buchungsdaten'),
                        content: Text(
                          'Raum: ${savedData['room']}\n'
                          'Datum: $formattedDate\n'
                          'Zeitslot: ${savedData['timeSlot']}\n'
                          'Name: ${savedData['name']}\n'
                          'E-Mail: ${savedData['email']}',
                        ),
                        actions: [
                          TextButton(
                            child: Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('Zeige gespeicherte Daten'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
