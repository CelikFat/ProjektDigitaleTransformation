import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:studi_cafe/home_page/sponsor_list.dart';

class DatabaseStream {
  late List<Sponsor> _sponsorListe;

  DatabaseStream() {
    _sponsorListe = [];
    _loadSponsorListe();
  }

  List<Sponsor> get sponsorListe => _sponsorListe.toList();

  Future<void> _loadSponsorListe() async {
    try {
      final QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('Sponsor').get();
      
      _sponsorListe = querySnapshot.docs.map((doc) {
        return Sponsor(
          name: doc['SponsorName'] ?? '',
          nr: doc['SponsorNr'] ?? 0,
        );
      }).toList();

      // Debugging-Ausgabe für die gesamte Liste
      print('Gesamte Sponsor-Liste: $_sponsorListe');
    } catch (error) {
      print('Fehler beim Laden der Daten: $error');
    }
  }
}
