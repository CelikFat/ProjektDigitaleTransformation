import 'package:flutter/material.dart';
import 'package:studi_cafe/Info/info_desktop.dart';
import 'package:studi_cafe/Info/info_mobile.dart';
import 'package:studi_cafe/responsive/responsive_layout.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveLayout(
        mobileBody: InfoPageMobile(),
        desktopBody: InfoPageDesktop()
      ),
    );
  }
}