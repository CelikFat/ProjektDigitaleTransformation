import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart' as google_fonts;
import 'package:studi_cafe/footerbar.dart';
import 'package:studi_cafe/navbar_desktop.dart';

class HomePageDesktop extends StatelessWidget {
  const HomePageDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverPersistentHeader(
            pinned: true,
            delegate: _StickyNavbarDelegate(
              child: NavbarDesktop(),
            ),
          ),
        ],
        body: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/homepage/experimental_background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.25,
                ),
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 30),
                        Container(
                          height: 300,
                          decoration: BoxDecoration(
                            color: const Color(0xFFD98E44),
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: Colors.white,
                              width: 8.0,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "Willkommen im Studi-Cafe",
                              style: google_fonts.GoogleFonts.dancingScript(
                                fontSize: 50,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.transparent, width: 20),
                          ),
                          child: Image.asset(
                            'assets/logo/app_logo.png',
                            width: 200,
                            height: 200,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text('Placeholder Text'),
                        const SizedBox(height: 20),
                        const Text('Öffnungszeiten: Monday-Sunday, 8:00 AM - 10:00 PM'),
                        const SizedBox(height: 20),
                        InkWell(
                          onTap: () {
                            // Handle navigation to ContactPage
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomePageDesktop(),
                              ),
                            );
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('So finden Sie zu uns: '),
                              Text(
                                'einmal hier klicken!',
                                style: TextStyle(
                                  color: Colors.orange,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            // Add navigation logic to Raumbuchung page
                          },
                          child: const Text('Raumbuchung'),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.25,
                ),
              ],
            ),
          ),
        ),
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
