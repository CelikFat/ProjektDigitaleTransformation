import 'package:flutter/material.dart';
import 'package:studi_cafe/food_menu/menu_item.dart';
import 'package:studi_cafe/food_menu/menu_lists_file.dart';
//import 'package:google_fonts/google_fonts.dart' as google_fonts;
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
      itemCount: listMenus.length + 1, // One extra for the header
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 15,
        );
      },
      itemBuilder: (context, index) {
        if (index == 0) {
          // Display header for the entire menu list
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
                /*style: google_fonts.GoogleFonts.dancingScript(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  fontStyle: FontStyle.italic,
                  wordSpacing: 2.0,
                ), */
              ),
            ),
          );
        } else {
          // Display menu items for each menu
          final menu = listMenus[index - 1];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header for each menu
              Container(
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
                    menu.$2,
                   /* style: google_fonts.GoogleFonts.abel(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ), */
                  ),
                ),
              ),
              // Menu items for each menu
              ...menu.$1.map((item) => Container(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: _buildMenuItem(item: item)
              )).toList(),
            ],
          );
        }
      },
    );
  }

  Widget _buildMenuItem( { required Item item}) {
    return MenuListItem(
      name: item.name,
      price: item.formattedTotalItemPrice,
      photoProvider: item.imageProvider,
    );
  }
} 





