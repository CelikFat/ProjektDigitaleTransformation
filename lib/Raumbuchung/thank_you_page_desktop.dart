import 'package:flutter/material.dart';
import 'package:studi_cafe/Raumbuchung/customer.dart';
import 'package:intl/intl.dart';
import 'package:studi_cafe/footerbar.dart';
import 'package:studi_cafe/home_page/home_page.dart';
import 'package:studi_cafe/navbar_desktop.dart';

class ThankYouPageDesktop extends StatelessWidget {
  const ThankYouPageDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContent(context),
      bottomNavigationBar: const FooterBar(),
    );
  }

  Widget _buildContent(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        SliverPersistentHeader(
          pinned: true,
          delegate: StickyNavbarDelegate(
            child: const NavbarDesktop(),
          ),
        ),
      ],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Vielen Dank für deine Buchung! Du erhältst eine Bestätigung per Mail.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              const Text(
                'Du kannst nun wieder zurück zur Homepage :)',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                child: const Text('zurück zur Homepage'),
                onPressed: () {
                  // Navigate to the homepage
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  Map<String, dynamic> savedData = await Kunde.getData();
                  DateTime savedDate = DateTime.parse(savedData['selectedDay']);
                  String formattedDate = DateFormat('yyyy-MM-dd').format(savedDate);
                  // Anzeigen der Daten
                  // ignore: use_build_context_synchronously
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Gespeicherte Buchungsdaten'),
                        content: Text(
                          'Raum: ${savedData['room']}\n'
                          'Datum: $formattedDate\n'
                          'Zeitslot: ${savedData['timeSlot']}\n'
                          'Name: ${savedData['name']}\n'
                          'E-Mail: ${savedData['email']}',
                        ),
                        actions: [
                          TextButton(
                            child: const Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text('Zeige gespeicherte Daten'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}