import 'package:flutter/material.dart';
import 'package:studi_cafe/Raumbuchung/thank_you_page_mobile.dart';
import 'package:studi_cafe/Raumbuchung/thank_you_page_desktop.dart';
import 'package:studi_cafe/responsive/responsive_layout.dart';

class ThankYouPage extends StatelessWidget {
  const ThankYouPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveLayout(
        mobileBody: ThankYouPageMobile(),
        desktopBody: ThankYouPageDesktop()
      ),
    );
  }
}