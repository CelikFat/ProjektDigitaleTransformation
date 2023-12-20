import 'package:flutter/material.dart';
import 'package:studi_cafe/Events/event_list.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
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


