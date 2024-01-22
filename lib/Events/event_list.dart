import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';



/*var titleList = [
  "Weihnachtsmarkt",
  "Waffelbacken",
  "Vortrag"
];

var descriptionList = [
  "Ein wunderschöner kleiner Weihnachtsmarkt in unserem Studiencafe",
  "Mit uns Studenten Waffeln backten, morgen 13.10 um 19 Uhr",
  "Ein Vortrag über das Thema Motivation vom Gesangsverein Tailfingen"
];

var imageList = [
  "assets/images/weihnachtsmarkt.jpg",
  "assets/images/Waffeln.jpeg",
  "assets/images/Vortrag.webp"
];
*/
class Event {
  final String title;
  final String description;
  final String imageUrl;

  Event({required this.title, required this.description, required this.imageUrl});
}


class EventService {
  final CollectionReference eventsCollection = FirebaseFirestore.instance.collection('Event');

  Future<List<Event>>  fetchEventsFromDatabase() async {
    try {
      QuerySnapshot querySnapshot = await eventsCollection.get();

      List<Event> events = [];

      querySnapshot.docs.forEach((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

        Event event = Event(
          title: data['EventName'] ?? '',
          description: data['EventBeschreibung'] ?? '',
          imageUrl: data['EventBild'] ?? '',
        );

        events.add(event);
      });

      return events;
    } catch (e) {
      print('Fehler beim Abrufen der Daten: $e');
      return [];
    }
  }
}


