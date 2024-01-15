import 'package:flutter/material.dart';
import 'package:studi_cafe/Events/event_page_desktop.dart';
import 'package:studi_cafe/Events/event_page_mobile.dart';
import 'package:studi_cafe/responsive/responsive_layout.dart';

class EventPage extends StatelessWidget {
  const EventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveLayout(
        mobileBody: EventPageMobile(),
        desktopBody: EventPageDesktop()
      ),
    );
  }
}