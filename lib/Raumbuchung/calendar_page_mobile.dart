import 'package:flutter/material.dart';
import 'package:studi_cafe/footerbar.dart';
import 'package:studi_cafe/headerbar.dart';
import 'package:studi_cafe/sidebar.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:studi_cafe/Raumbuchung/booking_details_page.dart';
import 'package:intl/date_symbol_data_local.dart';

class CalendarPageMobile extends StatefulWidget {
  final String roomName;

  const CalendarPageMobile({super.key, required this.roomName});

  @override
  CalendarPageState createState() => CalendarPageState();
}

class CalendarPageState extends State<CalendarPageMobile> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  final List<String> _selectedTimeSlots = [];

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
      const SnackBar(
        content: Text("Es dürfen nur maximal 4 Timeslots gewählt werden"),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0xD4, 0xA3, 0x73, 100),
      appBar: const HeaderBar(),
      drawer: const AppSidebar(),
      bottomNavigationBar: const FooterBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Wähle den Tag an dem du ${widget.roomName} buchen möchtest',
              style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
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
                  child: const Text('Weiter'),
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
