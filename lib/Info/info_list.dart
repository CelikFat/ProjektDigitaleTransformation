import 'package:cloud_firestore/cloud_firestore.dart';

class Item {
  late String question;
  late String answer;
  bool isExpanded = false;

  Item({required this.question, required this.answer});
}

Future<List<Item>> fetchItemsFromFirebase() async {
  // Replace 'your_collection' with the actual collection name in your Firestore database
  QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('FAQ').get();

  List<Item> items = [];

  querySnapshot.docs.forEach((doc) {
    // Assuming your documents have 'question' and 'answer' fields
    String question = doc['FaqFrage'];
    String answer = doc['FaqAntwort'];

    items.add(Item(question: question, answer: answer));
  });

  return items;
}