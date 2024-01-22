import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:studi_cafe/footerbar.dart';
import 'package:studi_cafe/headerbar.dart';
import 'package:studi_cafe/home_page/home_page.dart';
import 'package:studi_cafe/sidebar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:studi_cafe/Raumbuchung/BookingDetailsPage.dart';


class BookingData {
  final String room;
  final DateTime date;
  final String timeSlot;
  final String name;
  final String email;

  BookingData({
    required this.room,
    required this.date,
    required this.timeSlot,
    required this.name,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      'room': room,
      'date': date.toUtc(), // Speichere das Datum als UTC, falls erforderlich
      'timeSlot': timeSlot,
      'name': name,
      'email': email,
    };
  }
}
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
              onPressed: () async {
                Map<String, dynamic> savedData = await Kunde.getData();
                DateTime savedDate = DateTime.parse(savedData['selectedDay']);
                String formattedDate = DateFormat('yyyy-MM-dd').format(savedDate);

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

                // Hier speicherst du die Daten in Firestore
                await saveBookingData(BookingData(
                  room: savedData['room'],
                  date: savedDate,
                  timeSlot: savedData['timeSlot'],
                  name: savedData['name'],
                  email: savedData['email'],
                ));
              },
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

Future<void> saveBookingData(BookingData bookingData) async {
   try {
      print('Starte das Speichern der Daten');
      await FirebaseFirestore.instance.collection('Reservierung').add({
         'room': bookingData.room,
         'date': bookingData.date,
         'timeSlot': bookingData.timeSlot,
         'name': bookingData.name,
         'email': bookingData.email,
      });
      print('Daten erfolgreich gespeichert');
   } catch (e) {
      print('Fehler beim Speichern der Daten: $e');
   }
}