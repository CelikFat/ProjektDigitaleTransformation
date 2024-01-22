import 'package:flutter/material.dart';
import 'package:studi_cafe/Events/event_list.dart';
import 'package:studi_cafe/footerbar.dart';
import 'package:studi_cafe/headerbar.dart';
import 'package:studi_cafe/sidebar.dart';

class EventPageMobile extends StatefulWidget {
  const EventPageMobile({Key? key}) : super(key: key);

  @override
  State<EventPageMobile> createState() => _EventPageMobileState();
}

class _EventPageMobileState extends State<EventPageMobile> {
  late Future<List<Event>> _data;

  @override
  void initState() {
    super.initState();
    _data = EventService().fetchEventsFromDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HeaderBar(),
      drawer: const AppSidebar(),
      bottomNavigationBar: const FooterBar(),
      body: Column(
        children: [
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
            child: FutureBuilder<List<Event>>(
              future: _data,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Fehler beim Laden der Daten: ${snapshot.error}');
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      Event event = snapshot.data![index];
                      return GestureDetector(
                        onTap: () {
                          showDialogFunc(context, event.imageUrl, event.title, event.description);
                        },
                        child: Card(
                          child: Row(
                            children: <Widget>[
                              SizedBox(
                                width: 100,
                                height: 100,
                                child: Image.network(event.imageUrl),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        event.title,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 10,),
                                      Container(
                                        child: Text(
                                          event.description,
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          softWrap: true,
                                        ),
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
                  );
                }
              },
            ),
          ),
        ],
      ),
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
                    child: Image.network(
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
