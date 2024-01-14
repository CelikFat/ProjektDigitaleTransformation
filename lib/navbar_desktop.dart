import 'package:flutter/material.dart';
import 'package:studi_cafe/Info/info_page.dart';
import 'package:studi_cafe/home_page/home_page.dart';

class NavbarDesktop extends StatelessWidget {
  const NavbarDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(0xD4, 0xA3, 0x73, 100), // Change to your desired color
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Image.asset(
            'assets/logo/app_logo_klein.png', // Replace with your logo image path
            width: 50,
            height: 100,
          ),
          const Text(
            'StudiCafe',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const Spacer(),
          const _NavBarItem(icon: Icons.home, title: 'Home', page: HomePage()),
          const _NavBarItem(icon: Icons.event, title: 'Raumbuchung', page: HomePage()),
          const _NavBarItem(icon: Icons.restaurant_menu, title: 'Speisekarte', page: HomePage()),
          const _NavBarItem(icon: Icons.event_note, title: 'Events', page: HomePage()),
          const _NavBarItem(icon: Icons.info, title: 'Info', page: InfoPage()),
          const _NavBarItem(icon: Icons.contact_phone, title: 'Kontakt', page: HomePage()),
        ],
      ),
    );
  }
}

class _NavBarItem extends StatefulWidget {
  final IconData icon;
  final String title;
  final Widget page;

  const _NavBarItem({
    required this.icon,
    required this.title,
    required this.page,
  });

  @override
  _NavBarItemState createState() => _NavBarItemState();
}

class _NavBarItemState extends State<_NavBarItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: InkWell(
        onTap: () {
          // Navigate to the specified page
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => widget.page),
          );
        },
        child: Row(
          children: [
            Icon(
              widget.icon,
              color: isHovered ? Colors.orange : Colors.white,
            ),
            const SizedBox(width: 5),
            Text(
              widget.title,
              style: TextStyle(
                color: isHovered ? Colors.orange : Colors.white,
              ),
            ),
            const SizedBox(width: 20),
          ],
        ),
      ),
    );
  }

  void _onHover(bool hover) {
    setState(() {
      isHovered = hover;
    });
  }
}


class StickyNavbarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  StickyNavbarDelegate({required this.child});

  @override
  double get minExtent => 60; // Adjust the height as needed

  @override
  double get maxExtent => 60; // Adjust the height as needed

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
