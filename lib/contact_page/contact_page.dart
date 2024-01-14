import 'package:flutter/material.dart';
import 'package:studi_cafe/contact_page/contact_page_desktop.dart';
import 'package:studi_cafe/contact_page/contact_page_mobile.dart';
import 'package:studi_cafe/responsive/responsive_layout.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveLayout(
        mobileBody: ContactPageMobile(),
        desktopBody: ContactPageDesktop()
      ),
    );
  }
}