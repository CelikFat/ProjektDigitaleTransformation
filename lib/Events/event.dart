import 'package:flutter/material.dart';
import 'package:studi_cafe/Events/event_list.dart';
import 'package:studi_cafe/footerbar.dart';
import 'package:studi_cafe/headerbar.dart';
import 'package:studi_cafe/sidebar.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
 @override
  Widget build(BuildContext context) {
    return Scaffold (
      backgroundColor: const Color.fromRGBO(0xD4, 0xA3, 0x73, 100),
      appBar: const HeaderBar(),
      drawer: const AppSidebar(),
      body: Column(
        children: [
          // Hier können Sie den Container hinzufügen
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
            // Verwenden Sie Expanded, damit die ListView den verfügbaren Platz einnimmt
            child: _buildEventList(),
          ),
        ],
      ),
      bottomNavigationBar: const FooterBar(),
    );
  }

  Widget _buildEventList() {
    return ListView.builder(
        itemCount: imageList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              showDialogFunc(context, imageList[index], titleList[index], descriptionList[index]);
            },
            child: Card(
              child: Row(
                children: <Widget> [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: Image.asset(imageList[index]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column (
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          titleList[index],
                          style: const TextStyle(
                          fontSize:18,
                          fontWeight: FontWeight.bold,
                          ),
                          ),
                          const SizedBox(height: 10,),
                          // ignore: avoid_unnecessary_containers
                          Container( 
                            child: Text(
                              descriptionList[index],

                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              )              
            ),
          );
        }
      );
  }

  Future<dynamic> showDialogFunc (context, img, title, desc) {
    return showDialog(context: context, builder: (context) {
      return Center(
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(15),
            width: MediaQuery.of( context).size.width *0.7,
            height: 320,
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
                Text(
                  desc,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ),
      );
    });
  }

}


