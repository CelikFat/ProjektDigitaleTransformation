import 'package:flutter/material.dart';
import 'package:studi_cafe/Raumbuchung/booking_details_page_desktop.dart';
import 'package:studi_cafe/Raumbuchung/booking_details_page_mobile.dart';
import 'package:studi_cafe/responsive/responsive_layout.dart';

class BookingDetailsPage extends StatelessWidget {
  final DateTime selectedDay;
  final String selectedTimeSlot;
  final String selectedRoom;

  const BookingDetailsPage(
    {
      super.key,
      required this.selectedDay,
      required this.selectedTimeSlot,
      required this.selectedRoom
      }
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
        mobileBody: BookingDetailsPageMobile(
          selectedDay: selectedDay,
          selectedTimeSlot: selectedTimeSlot,
          selectedRoom: selectedRoom
          ),
        desktopBody: BookingDetailsPageDesktop(
          selectedDay: selectedDay,
          selectedTimeSlot: selectedTimeSlot,
          selectedRoom: selectedRoom
          ),
      ),
    );
  }
}