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

List<Item> generateItems() {
  return [
    Item(
      question: 'Wo finde ich das Studiencafe?',
      answer: 'Du findest das Studiencafe in der Vorstadt',
    ),
    Item(
      question: 'Gibt es auch Kaffee im Studiencafe?',
      answer: 'Jawohl! Es gibt super leckeren Kaffee :)',
    ),
    // Füge hier weitere Fragen und Antworten hinzu
  ];
}