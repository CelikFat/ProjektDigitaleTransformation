import 'package:flutter/material.dart';
import 'package:studi_cafe/Raumbuchung/calendar_page_mobile.dart';
import 'package:studi_cafe/Raumbuchung/calendar_page_desktop.dart';
import 'package:studi_cafe/responsive/responsive_layout.dart';

class CalendarPage extends StatelessWidget {
  final String roomName;
  const CalendarPage({super.key, required this.roomName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
        mobileBody: CalendarPageMobile(roomName: roomName),
        desktopBody: CalendarPageDesktop(roomName: roomName)
      ),
    );
  }
}