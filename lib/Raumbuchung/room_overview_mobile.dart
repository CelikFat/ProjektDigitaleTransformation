import 'package:flutter/material.dart';
import 'package:studi_cafe/footerbar.dart';
import 'package:studi_cafe/headerbar.dart';
import 'package:studi_cafe/sidebar.dart';
import 'package:studi_cafe/Raumbuchung/calendar_page.dart';

class RoomBookingPageMobile extends StatefulWidget {
  const RoomBookingPageMobile({super.key});

  @override
  RoomBookingPageState createState() => RoomBookingPageState();
}

class RoomBookingPageState extends State<RoomBookingPageMobile> {
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
      backgroundColor: const Color.fromRGBO(0xD4, 0xA3, 0x73, 100),
      appBar: const HeaderBar(),
      drawer: const AppSidebar(),
      bottomNavigationBar: const FooterBar(),
      body: Column(
        children: [
          Container(
              decoration: BoxDecoration(
                color: const Color(0xFFD98E44),
                borderRadius: BorderRadius.circular(10.0), // Optional: Add border radius for rounded corners
                border: Border.all(
                  color: Colors.white, // White border color
                  width: 8.0, // Adjust the width of the border
                ),
              ),
              width: double.infinity,
              height: 80,
              child: const Center(
                child: Text(
                  'Raumübersicht',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    fontStyle: FontStyle.italic,
                    wordSpacing: 2.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
          GridView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(8.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                    duration: const Duration(milliseconds: 200),
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
                        style: const TextStyle(
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
                    style: const TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              CalendarPage(roomName: selectedRoom!),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.brown,
                    ),
                    child: const Text('Weiter'),
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
