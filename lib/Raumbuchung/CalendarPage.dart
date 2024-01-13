import 'package:flutter/material.dart';
import 'package:studi_cafe/footerbar.dart';
import 'package:studi_cafe/headerbar.dart';
import 'package:studi_cafe/sidebar.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:studi_cafe/Raumbuchung/BookingDetailsPage.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class CalendarPage extends StatefulWidget {
  final String roomName;

  CalendarPage({Key? key, required this.roomName}) : super(key: key);

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  List<String> _selectedTimeSlots = [];

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('de_DE', null);
  }

  List<String> _getEventsForDay(DateTime day) {
    return List.generate(11, (index) => "${8 + index}:00 - ${9 + index}:00");
  }

  void _toggleTimeSlot(String timeSlot) {
    if (_selectedTimeSlots.contains(timeSlot)) {
      _selectedTimeSlots.remove(timeSlot);
    } else if (_selectedTimeSlots.length >= 4) {
      _showMaxSlotsAlert();
    } else {
      _selectedTimeSlots.add(timeSlot);
    }
    setState(() {});
  }

  void _showMaxSlotsAlert() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Es dürfen nur maximal 4 Timeslots gewählt werden"),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HeaderBar(),
      drawer: const AppSidebar(),
      bottomNavigationBar: const FooterBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Wähle den Tag an dem du ${widget.roomName} buchen möchtest',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          TableCalendar(
            locale: 'de_DE',
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            availableCalendarFormats: const {
              CalendarFormat.month: 'Monat',
              CalendarFormat.twoWeeks: '2 Wochen',
              CalendarFormat.week: 'Woche'
            },
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
                _selectedTimeSlots.clear();
              });
            },
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() => _calendarFormat = format);
              }
            },
            onPageChanged: (focusedDay) => _focusedDay = focusedDay,
          ),
          if (_selectedDay != null)
            Expanded(
              child: ListView.builder(
                itemCount: _getEventsForDay(_selectedDay!).length,
                itemBuilder: (context, index) {
                  String timeSlot = _getEventsForDay(_selectedDay!)[index];
                  bool isSelected = _selectedTimeSlots.contains(timeSlot);

                  return Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 4.0),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.brown : null,
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: ListTile(
                      title: Text(timeSlot),
                      onTap: () => _toggleTimeSlot(timeSlot),
                    ),
                  );
                },
              ),
            ),
          if (_selectedTimeSlots.isNotEmpty)
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
                          selectedTimeSlot: _selectedTimeSlots.join(', '),
                          selectedRoom: widget.roomName,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}
