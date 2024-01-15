
import 'package:cloud_firestore/cloud_firestore.dart';
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

Future<List<Item>> fetchItemsFromFirebase() async {
  QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('FAQ').get();

  List<Item> items = querySnapshot.docs.map((doc) {
    return Item(
      question: doc['FaqFrage'],
      answer: doc['FaqAntwort'],
      isExpanded: false,
    );
  }).toList();

  return items;
}