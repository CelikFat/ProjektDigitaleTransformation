import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart' as google_fonts;
import 'package:studi_cafe/footerbar.dart';
import 'package:studi_cafe/navbar_desktop.dart';

class HomePageDesktop extends StatelessWidget {
  const HomePageDesktop({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // SliverPersistentHeader for sticky NavbarDesktop
          SliverPersistentHeader(
            pinned: true,
            delegate: _StickyNavbarDelegate(
              child: NavbarDesktop(),
            ),
          ),

          // SliverToBoxAdapter for the rest of the content
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 30),
                  Center(
                    child: Text(
                      "Willkommen im Studi-Cafe",
                      style: google_fonts.GoogleFonts.dancingScript(
                        fontSize: 50,
                      ),
                    ),
                  ),
                  // Project Image
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.transparent, width: 20),
                    ),
                    child: Image.asset(
                      'assets/logo/app_logo.png', // Replace with your image path
                      width: 200,
                      height: 200,
                    ),
                  ),

                  // Placeholder Text
                  const SizedBox(height: 20),
                  const Text('Placeholder Text'),

                  // Opening Hours
                  const SizedBox(height: 20),
                  const Text('Opening Hours: Monday-Sunday, 8:00 AM - 10:00 PM'),

                  // How to Get There
                  const SizedBox(height: 20),
                  const Text('How to Get There: Your directions go here'),

                  // Raumbuchung Button
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Add navigation logic to Raumbuchung page
                    },
                    child: const Text('Raumbuchung'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const FooterBar(),
    );
  }
}


class _StickyNavbarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _StickyNavbarDelegate({required this.child});

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