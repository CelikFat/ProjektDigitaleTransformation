import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart' as google_fonts;
import 'package:studi_cafe/food_menu/mensa_menu.dart';

import 'package:studi_cafe/food_menu/menu_item.dart';
import 'package:studi_cafe/food_menu/menu_lists_file.dart';
import 'package:studi_cafe/footerbar.dart';
import 'package:studi_cafe/headerbar.dart';
import 'package:studi_cafe/sidebar.dart';


class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      backgroundColor: const Color.fromRGBO(0xD4, 0xA3, 0x73, 100),
      appBar: const HeaderBar(),
      drawer: const AppSidebar(),
      body: _buildContent(),
      bottomNavigationBar: const FooterBar(),
    );
  }

  Widget _buildContent() {
    return _buildMenuLists();
  }

  Widget _buildMenuLists() {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: listMenus.length + 2, // One extra for the header, one extra for the mensa menu
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 15,
        );
      },
      itemBuilder: (context, index) {
        if (index == 0) {
          return Container(
            decoration: BoxDecoration(
              color: const Color(0xFFD98E44),
              borderRadius: BorderRadius.circular(10.0), // Optional: Add border radius for rounded corners
              border: Border.all(
                color: Colors.white, // White border color
                width: 8.0, // Adjust the width of the border
              ),
            ),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.2,
            child: Center(
              child: Text(
                'Speisekarte StudiCafe Albstadt',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: google_fonts.GoogleFonts.dancingScript(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  fontStyle: FontStyle.italic,
                  wordSpacing: 2.0,
                ),
              ),
            ),
          );
        } else if (index <= listMenus.length) {
          final menu = listMenus[index - 1];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header for each menu
              _buildMenuHeader( menu.$2),
              // Menu items for each menu
              ...menu.$1.map((item) => Container(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: _buildMenuItem(item: item)
              )),
            ],
          );
        } else {
          return _buildMensaList();
        }
      },
    );
  }

  Widget _buildMenuHeader(String menuName) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFD98E44),
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: Colors.white,
          width: 8.0,
        ),
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 5),
      child: Center(
        child: Text(
          menuName,
          style: google_fonts.GoogleFonts.abel(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }


  Widget _buildMenuItem( { required Item item}) {
    return MenuListItem(
      name: item.name,
      price: item.formattedTotalItemPrice,
      photoProvider: item.imageProvider,
    );
  }


  Widget _buildMensaList() {
  return FutureBuilder<MensaList>(
    future: fetchMensaMenu(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        // While the data is still loading, display a loading indicator or placeholder
        return CircularProgressIndicator();
      } else if (snapshot.hasError) {
        // If there's an error, display an error message
        return Text('Error: ${snapshot.error}');
      } else if (!snapshot.hasData || snapshot.data!.menus.isEmpty) {
        // If there's no data or the menus list is empty, display a message
        return Text('No menu data available');
      } else {
        // If the data is available, build the UI with Text widgets
        return Column(
          children: [
            _buildMenuHeader("Mensa"),
            Text("${snapshot.data!.canteenId}"),
            Text("${snapshot.data!.canteen}"),
            Text("${snapshot.data!.menus}"),
            for (MensaMenu menu in snapshot.data!.menus)
              Column(
                children: [
                  Text('Menu Line: ${menu.menuLine}'),
                  Text('Thumbnail: ${menu.thumbnail}'),
                  Text('Student Price: ${menu.studentPrice}'),
                  Text('Guest Price: ${menu.guestPrice}'),
                  Text('Menu Date: ${menu.menuDate}'),
                  // Additional Text widgets for other attributes
                  const Divider(), // Add a divider between menus
                ],
              ),
          ],
        );
      }
    },
  );
}


  Future<MensaList> fetchMensaMenu() async {
    final response = await http.get(
      Uri.parse('https://www.my-stuwe.de/wp-json/mealplans/v1/canteens/645?lang=de')
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = jsonDecode(response.body);
      print(jsonData.entries);
      return MensaList.fromJson(jsonData);
    } else {
      throw Exception('Failed to load MensaMenu');
    }
  }
  
} 





