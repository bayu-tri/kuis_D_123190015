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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AppDetail(detailApp: app)));
              },
              child: Card(
                  child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      app.imageLogo,
                      height: 105,
                      width: 105,
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Wrap(
                              direction: Axis.vertical,
                              spacing: 10, // <-- Spacing between children
                              children: <Widget>[
                                Text(app.name,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    )),
                                Text(app.genre,
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black.withOpacity(0.6))),
                                Wrap(
                                    direction: Axis.horizontal,
                                    spacing: 8,
                                    children: [
                                      Image.network(
                                        'https://purepng.com/public/uploads/thumbnail/purepng.com-grey-starstargeometricallydecagonconcavestardomclipartblackgrey-1421526502793olugc.png',
                                        height: 16,
                                        width: 16,
                                      ),
                                      Text(app.rating,
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black
                                                  .withOpacity(0.6))),
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
