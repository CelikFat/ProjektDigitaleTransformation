import 'package:flutter/material.dart';
import 'package:studi_cafe/home_page/home_page_desktop.dart';
import 'package:studi_cafe/home_page/home_page_mobile.dart';
import 'package:studi_cafe/responsive/responsive_layout.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveLayout(
        mobileBody: HomePageMobile(),
        desktopBody: HomePageDesktop()
      ),
    );
  }
}