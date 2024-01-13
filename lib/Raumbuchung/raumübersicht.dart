import 'package:flutter/material.dart';
import 'package:studi_cafe/footerbar.dart';
import 'package:studi_cafe/headerbar.dart';
import 'package:studi_cafe/sidebar.dart';
import 'package:studi_cafe/Raumbuchung/CalendarPage.dart';

class RoomBookingPage extends StatefulWidget {
  const RoomBookingPage({super.key});

  @override
  _RoomBookingPageState createState() => _RoomBookingPageState();
}

class _RoomBookingPageState extends State<RoomBookingPage> {
  String? selectedRoom;
  String? roomInfo;
  Map<String, bool> isHovering = {};

  final Map<String, String> roomDetails = {
    'Raum 1':
        'Unser Besprechungsraum1 verbindet professionselles Business-Umfeld mit ansprechendem Design. Corporates finden passende Räumlichkeiten für größere Veranstaltungen und Konferenzen, gerne ergänzt um Catering & Event-Location. Das ansprechende Design, modernste Präsentation- & Soundtechnik sowie das hochwertige Mobiliar schafft die richtige Atmosphäre für effiziente Veranstaltungen und Konferenzen.',
    'Raum 2':
        'Tagsüber können Sie in unserem FOYER Pausencatering, Lunch oder eine Kreativpause zwischendurch genießen. Nach der Veranstaltung wird diese zur Location für Business-Events: Vom Stehempfang, Networking- bis zum gemütlichen After-Work-Event. Gerne sind wir Ihnen bei der Event-Planung behilflich.',
  };

  @override
  Widget build(BuildContext context) {
    List<String> rooms = roomDetails.keys.toList();

    return Scaffold(
      appBar: const HeaderBar(),
      drawer: const AppSidebar(),
      bottomNavigationBar: const FooterBar(),
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
              String room = rooms[index];
              bool isSelected = room == selectedRoom;
              isHovering[room] = isHovering[room] ?? false;

              return MouseRegion(
                cursor: SystemMouseCursors.click,
                onEnter: (_) => _setHovering(room, true),
                onExit: (_) => _setHovering(room, false),
                child: GestureDetector(
                  onTap: () => selectRoom(room),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? Colors.brown[200]
                          : isHovering[room]!
                              ? Colors.grey[200]
                              : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: isSelected ? Colors.brown : Colors.grey,
                        width: 2,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        room,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
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
                          builder: (context) =>
                              CalendarPage(roomName: selectedRoom!),
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

  void _setHovering(String room, bool hovering) {
    setState(() {
      isHovering[room] = hovering;
    });
  }

  void selectRoom(String room) {
    setState(() {
      selectedRoom = room;
      roomInfo = roomDetails[room];
    });
  }
}
