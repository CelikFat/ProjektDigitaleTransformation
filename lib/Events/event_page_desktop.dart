import 'package:flutter/material.dart';
import 'package:studi_cafe/Events/event_list.dart';
import 'package:studi_cafe/footerbar.dart';
import 'package:studi_cafe/navbar_desktop.dart';

class EventPageDesktop extends StatelessWidget {
  const EventPageDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverPersistentHeader(
            pinned: true,
            delegate: StickyNavbarDelegate(
              child: const NavbarDesktop(),
            ),
          ),
        ],
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFFD98E44),
                borderRadius: BorderRadius.circular(10.0), // Optional: Add border radius for rounded corners
                border: Border.all(
                  color: Colors.white, // White border color
                  width: 8.0, // Adjust the width of the border
                ),
              ),
              width: double.infinity,
              height: 80,
              child: const Center(
                child: Text(
                  'Unsere Events',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    fontStyle: FontStyle.italic,
                    wordSpacing: 2.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: imageList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      showDialogFunc(context, imageList[index], titleList[index], descriptionList[index]);
                    },
                    child: Card(
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: 100,
                            height: 100,
                            child: Image.asset(imageList[index]),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    titleList[index],
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10,),
                                  Text(
                                    descriptionList[index],
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const FooterBar(),
    );
  }

  Future<dynamic> showDialogFunc(context, img, title, desc) async {
    final textWidget = Text(
      desc,
      style: const TextStyle(
        fontSize: 15,
      ),
      textAlign: TextAlign.center,
    );

    final textSpan = TextSpan(
      text: desc,
      style: const TextStyle(
        fontSize: 15,
      ),
    );

    final textPainter = TextPainter(
      text: textSpan,
      maxLines: 3, // Adjust the number of lines as needed
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: MediaQuery.of(context).size.width * 0.7 - 30);

    final textHeight = textPainter.height;

    final dialogHeight = 320 + textHeight;

    return showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width * 0.7,
              height: dialogHeight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(
                      img,
                      width: 200,
                      height: 200,
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Expanded(
                    child: SingleChildScrollView(
                      child: textWidget,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
