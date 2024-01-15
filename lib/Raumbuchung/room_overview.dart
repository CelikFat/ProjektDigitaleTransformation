import 'package:flutter/material.dart';
import 'package:studi_cafe/Raumbuchung/room_overview_mobile.dart';
import 'package:studi_cafe/Raumbuchung/room_overview_desktop.dart';
import 'package:studi_cafe/responsive/responsive_layout.dart';

class RoomBookingPage extends StatelessWidget {
  const RoomBookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveLayout(
        mobileBody: RoomBookingPageMobile(),
        desktopBody: RoomBookingPageDesktop()
      ),
    );
  }
}