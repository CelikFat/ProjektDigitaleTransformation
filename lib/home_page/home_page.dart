import 'package:flutter/material.dart';
import 'package:studi_cafe/home_page/home_page_desktop.dart';
import 'package:studi_cafe/home_page/home_page_mobile.dart';
import 'package:studi_cafe/responsive/responsive_layout.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
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