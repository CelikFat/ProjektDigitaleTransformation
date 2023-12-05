import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:studi_cafe/Raumbuchung/BookingDetailsPage.dart';

class CalendarPage extends StatefulWidget {
  final String roomName; // Parameter für den Raumnamen hinzufügen

  CalendarPage({Key? key, required this.roomName})
      : super(key: key); // Konstruktor aktualisieren

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  String? _selectedTimeSlot; // Variable für den ausgewählten Zeit-Slot
  Map<DateTime, List<String>> _events = {};
  List<String> _selectedEvents = [];

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    _events = {
      DateTime.now().subtract(Duration(days: 30)): [
        '8:00 - 9:00 Event A',
        '9:00 - 10:00 Event B'
      ],
      DateTime.now().subtract(Duration(days: 27)): ['10:00 - 11:00 Event C'],
      // Platz für weitere Ereignisse
    };
  }

  List<String> _getEventsForDay(DateTime day) {
    return List.generate(11, (index) => "${8 + index}:00 - ${9 + index}:00");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Studi-Cafe Raumbuchung'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Wähle den Tag an dem du ${widget.roomName} buchen möchtest', // Text aktualisiert
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          TableCalendar(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
                _selectedEvents = _getEventsForDay(selectedDay);
              });
            },
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
          const SizedBox(height: 8.0),
          Expanded(
            child: ListView.builder(
              itemCount: _selectedEvents.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 4.0),
                  decoration: BoxDecoration(
                    color: _selectedTimeSlot == _selectedEvents[index]
                        ? Colors.brown
                        : null,
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: ListTile(
                    title: Text(_selectedEvents[index]),
                    onTap: () {
                      setState(() {
                        _selectedTimeSlot = _selectedEvents[
                            index]; // Speichern des ausgewählten Zeit-Slots
                      });
                    },
                  ),
                );
              },
            ),
          ),
          if (_selectedTimeSlot != null)
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    child: Text('Weiter'),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => BookingDetailsPage(
                            selectedDay: _selectedDay!,
                            selectedTimeSlot: _selectedTimeSlot!,
                          ),
                        ),
                      );
                    }),
              ),
            ),
        ],
      ),
    );
  }
}
