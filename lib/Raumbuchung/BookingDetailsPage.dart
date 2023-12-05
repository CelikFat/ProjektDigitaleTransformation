import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:studi_cafe/Raumbuchung/ThankYouPage.dart';

class BookingDetailsPage extends StatelessWidget {
  final DateTime selectedDay;
  final String selectedTimeSlot;
  final _formKey = GlobalKey<FormState>();

  BookingDetailsPage(
      {required this.selectedDay, required this.selectedTimeSlot});

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('dd.MM.yyyy').format(selectedDay);
    return Scaffold(
      appBar: AppBar(
        title: Text('Kontaktdaten'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Du buchst am $formattedDate,',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'im Zeit-Slot $selectedTimeSlot Uhr',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Gebe nun deine Kontaktdaten an:',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Bitte Namen eingeben';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'E-Mail',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Bitte E-Mail-Adresse eingeben';
                      }
                      // Hier zusätzliche Validierung für E-Mail hinzufügen
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Überprüfen, ob das Formular gültig ist
                      if (_formKey.currentState!.validate()) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ThankYouPage(),
                          ),
                        );
                      }
                    },
                    child: Text('Bestätigen'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
