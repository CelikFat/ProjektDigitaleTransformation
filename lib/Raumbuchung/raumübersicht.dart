import 'package:flutter/material.dart';
import 'package:studi_cafe/footer.dart';
import 'package:studi_cafe/sidebar.dart';
import 'package:studi_cafe/Raumbuchung/CalendarPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Raum Buchungssystem',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? selectedRoom;
  String? roomInfo;

  final Map<String, String> roomDetails = {
    'Raum 1':
        'Unser Besprechungsraum1 verbindet professionselles Business-Umfeld mit ansprechendem Design. Corporates finden passende Räumlichkeiten für größere Veranstaltungen und Konferenzen, gerne ergänzt um Catering & Event-Location. Das ansprechende Design, modernste Präsentation- & Soundtechnik sowie das hochwertige Mobiliar schafft die richtige Atmosphäre für effiziente Veranstaltungen und Konferenzen. ',
    'Raum 2':
        'Tagsüber können Sie in unserem FOYER Pausencatering, Lunch oder eine Kreativpause zwischendurch genießen. Nach der Veranstaltung wird diese zur Location für Business-Events: Vom Stehempfang, Networking- bis zum gemütlichen After-Work-Event. Gerne sind wir Ihnen bei der Event-Planung behilflich.',
  };

  void selectRoom(String room) {
    setState(() {
      selectedRoom = room;
      roomInfo = roomDetails[room];
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> rooms = roomDetails.keys.toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Raumübersicht'),
      ),
      drawer: appSidebar, // Sidebar hinzu
      bottomNavigationBar: appFooter, // Footer hinzu
      body: Column(
        children: [
          GridView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(8.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: rooms.length,
            itemBuilder: (context, index) {
              bool isSelected = rooms[index] == selectedRoom;
              return GestureDetector(
                onTap: () => selectRoom(rooms[index]),
                child: Card(
                  color: isSelected ? Colors.brown[200] : Colors.white,
                  child: Center(
                    child: Text(
                      rooms[index],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  elevation: 5,
                ),
              );
            },
          ),
          if (selectedRoom != null)
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    roomInfo ?? '',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    child: Text('Weiter'),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CalendarPage(
                              roomName:
                                  selectedRoom!), // Raumname wird übergeben
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.brown,
                      onPrimary: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
