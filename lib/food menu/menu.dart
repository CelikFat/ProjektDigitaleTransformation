import 'package:flutter/material.dart';
import 'package:studi_cafe/food%20menu/menu_item.dart';
import 'package:studi_cafe/food%20menu/menu_lists_file.dart';
import 'package:studi_cafe/footer.dart';
import 'package:studi_cafe/sidebar.dart';
import 'package:google_fonts/google_fonts.dart' as google_fonts;

void main() {
  runApp(const MyMenu());
}

class MyMenu extends StatelessWidget {
  const MyMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HS Albsig Studi-Cafe',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromRGBO(0xD4, 0xA3, 0x73, 100)),
        useMaterial3: true,
      ),
      home: const MenuPage(),
    );
  }
}

@immutable
class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0xD4, 0xA3, 0x73, 100),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0xD4, 0xA3, 0x73, 100),
        actions: [
          Image.asset('assets/images/app_logo_klein.png'),
        ],
      ),
      drawer: appSidebar,
      body: _buildContent(),
      bottomNavigationBar: appFooter,
    );
  }

  Widget _buildContent() {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              child: _buildMenuLists(),
            ),
          ],
        ),
      ],
    );
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
            color: const Color(0xFFD98E44),
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
        } else {
          // Display menu items for each menu
          final menu = listMenus[index - 1];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header for each menu
              Container(
                color: Colors.brown, // Choose a color for the header
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 5),
                child: Center(
                  child: Text(
                    menu.$2,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
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





