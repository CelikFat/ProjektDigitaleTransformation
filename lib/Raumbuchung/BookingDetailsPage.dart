import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:studi_cafe/Raumbuchung/ThankYouPage.dart';
import 'package:studi_cafe/footerbar.dart';
import 'package:studi_cafe/headerbar.dart';
import 'package:studi_cafe/sidebar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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

  String getFormattedTimeSlots(String selectedTimeSlot) {
    List<String> slots = selectedTimeSlot.split(', ');
    slots.sort((a, b) => int.parse(a.split('-')[0].split(':')[0])
        .compareTo(int.parse(b.split('-')[0].split(':')[0])));
    return slots.join('\n');
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('dd.MM.yyyy').format(widget.selectedDay);
    String formattedTimeSlots = getFormattedTimeSlots(widget.selectedTimeSlot);
    bool multipleTimeSlots = widget.selectedTimeSlot.contains(',');

    return Scaffold(
      backgroundColor: const Color.fromRGBO(0xD4, 0xA3, 0x73, 100),
      appBar: const HeaderBar(),
      drawer: const AppSidebar(),
      bottomNavigationBar: const FooterBar(),
      body: 
        
        Column(
          children: [
            Row(
              children: [
                IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => Navigator.of(context).pop(),
                ),
                Text('Kontaktdaten'),
              ],
            ),
            Center(
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
                        multipleTimeSlots ? 'in den Zeit-Slots:' : 'im Zeit-Slot:',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        formattedTimeSlots,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
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
          ],
        ),
    );
  }
}
class Kunde {
  // ... (andere Methoden und Eigenschaften)

  static Future<void> saveData(
    String room,
    DateTime date,
    String timeSlot,
    String name,
    String email,
  ) async {
    try {
      await FirebaseFirestore.instance.collection('Reservierung').add({
        'room': room,
        'date': date,
        'timeSlot': timeSlot,
        'name': name,
        'email': email,
      });
      print('Daten erfolgreich in Firestore gespeichert');
    } catch (e) {
      print('Fehler beim Speichern der Daten in Firestore: $e');
    }
  }
   static Future<Map<String, dynamic>> getData() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'room': prefs.getString('room'),
      'selectedDay': prefs.getString('selectedDay'),
      'timeSlot': prefs.getString('timeSlot'),
      'name': prefs.getString('name'),
      'email': prefs.getString('email'),
    };
  }

  // ... (andere Methoden)
}
