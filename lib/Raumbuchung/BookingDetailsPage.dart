import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:studi_cafe/Raumbuchung/ThankYouPage.dart';
import 'package:studi_cafe/Raumbuchung/Kunde.dart';

class BookingDetailsPage extends StatefulWidget {
  final DateTime selectedDay;
  final String selectedTimeSlot;
  final String selectedRoom;

  BookingDetailsPage(
      {required this.selectedDay,
      required this.selectedTimeSlot,
      required this.selectedRoom});

  @override
  _BookingDetailsPageState createState() => _BookingDetailsPageState();
}

class _BookingDetailsPageState extends State<BookingDetailsPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  bool isValidEmail(String email) {
    final RegExp emailRegEx = RegExp(
      r'^[a-zA-Z0-9._]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$',
    );
    return emailRegEx.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('dd.MM.yyyy').format(widget.selectedDay);
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
                    'im Zeit-Slot ${widget.selectedTimeSlot} Uhr',
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
                    controller: _nameController,
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
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'E-Mail',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Bitte E-Mail-Adresse eingeben';
                      }
                      if (!isValidEmail(value)) {
                        return 'Bitte eine gültige E-Mail-Adresse eingeben';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Speichern der Daten
                        Kunde.saveData(
                                widget.selectedRoom,
                                widget.selectedDay,
                                widget.selectedTimeSlot,
                                _nameController.text,
                                _emailController.text)
                            .then((_) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ThankYouPage(),
                            ),
                          );
                        });
                      }
                    },
                    child: Text('Jetzt Buchen'),
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
