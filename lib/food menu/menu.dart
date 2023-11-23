import 'package:flutter/material.dart';
import 'package:studi_cafe/food%20menu/menuFile.dart';
import 'package:studi_cafe/food menu/menuItems.dart';
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
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromRGBO(0xD4, 0xA3, 0x73, 100)),
        useMaterial3: true,
      ),
      home: MenuPage(),
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
      backgroundColor: Color.fromRGBO(0xD4, 0xA3, 0x73, 100),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0xD4, 0xA3, 0x73, 100),
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
              child: _buildMenuList(),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMenuList() {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: exampleMenu.length + 1,
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 15,
        );
      },
      itemBuilder: (context, index) {
        if (index == 0) {
          return Container(
            color: Color(0xFFD98E44),
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
                  wordSpacing: 2.0
                ),
              ),
            ),
          );
        }
        else {
          final item = exampleMenu[index - 1];
          return _buildMenuItem(
            item: item,
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





