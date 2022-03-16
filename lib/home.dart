import 'package:flutter/material.dart';
import 'package:kuis_d_123190015/app_store.dart';
import 'package:kuis_d_123190015/app_detail.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter App Store'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final AppStore app = appList[index];
          return new GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AppDetail()));
              },
              child: Card(
                  child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(app.imageLogo),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Wrap(
                              direction: Axis.vertical,
                              spacing: 20, // <-- Spacing between children
                              children: <Widget>[
                                Text(app.name,
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    )),
                                Text(app.genre,
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black.withOpacity(0.6))),
                                Row(children: [
                                  // Should be a place for star
                                  Text('Rating : ' + app.rating,
                                      style: TextStyle(
                                          fontSize: 16,
                                          color:
                                              Colors.black.withOpacity(0.6))),
                                ]),
                              ],
                            )
                          ])),
                ],
              )));
        },
        itemCount: appList.length,
      ),
    );
  }
}
