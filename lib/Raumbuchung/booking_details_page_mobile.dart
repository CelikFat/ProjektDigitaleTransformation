import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:studi_cafe/Raumbuchung/thank_you_page.dart';
import 'package:studi_cafe/Raumbuchung/customer.dart';
import 'package:studi_cafe/footerbar.dart';
import 'package:studi_cafe/headerbar.dart';
import 'package:studi_cafe/sidebar.dart';

class BookingDetailsPageMobile extends StatefulWidget {
  final DateTime selectedDay;
  final String selectedTimeSlot;
  final String selectedRoom;

  const BookingDetailsPageMobile(
    {
      super.key,
      required this.selectedDay,
      required this.selectedTimeSlot,
      required this.selectedRoom
      }
  );

  @override
  BookingDetailsPageState createState() => BookingDetailsPageState();
}

class BookingDetailsPageState extends State<BookingDetailsPageMobile> {
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
    
      appBar: const HeaderBar(),
      drawer: const AppSidebar(),
      bottomNavigationBar: const FooterBar(),
      body: 
        
        Column(
          children: [
            Row(
              children: [
                IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.of(context).pop(),
                ),
                const Text('Kontaktdaten'),
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
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        multipleTimeSlots ? 'in den Zeit-Slots:' : 'im Zeit-Slot:',
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 18),
                      ),
                      Text(
                        formattedTimeSlots,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        'Gebe nun deine Kontaktdaten an:',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(
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
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
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
                      const SizedBox(height: 20),
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
                                  builder: (context) => const ThankYouPage(),
                                ),
                              );
                            });
                          }
                        },
                        child: const Text('Jetzt Buchen'),
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
