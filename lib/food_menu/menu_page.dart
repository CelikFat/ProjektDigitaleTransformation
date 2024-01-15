import 'package:flutter/material.dart';
import 'package:studi_cafe/food_menu/menu_page_mobile.dart';
import 'package:studi_cafe/food_menu/menu_page_desktop.dart';
import 'package:studi_cafe/responsive/responsive_layout.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveLayout(
        mobileBody: MenuPageMobile(),
        desktopBody: MenuPageDesktop()
      ),
    );
  }
}