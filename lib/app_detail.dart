import 'package:flutter/material.dart';
import 'package:kuis_d_123190015/app_store.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

class AppDetail extends StatelessWidget {
  final AppStore detailApp;
  const AppDetail({Key? key, required this.detailApp}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(detailApp.name),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      detailApp.imageLogo,
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
                              spacing: 8, // <-- Spacing between children
                              children: <Widget>[
                                Text(detailApp.name,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    )),
                                Text(detailApp.developer,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    )),
                                Text(detailApp.genre,
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
                                      Text(detailApp.rating,
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black
                                                  .withOpacity(0.6))),
                                    ]),
                              ],
                            )
                          ]))
                ],
              ),
              CarouselSlider(
                options: CarouselOptions(
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  scrollDirection: Axis.horizontal,
                ),
                items: detailApp.imageUrls.map((image) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 3.0),
                        child: Image.network(image),
                      );
                    },
                  );
                }).toList(),
              ),
              Text(detailApp.description,
                  style: TextStyle(
                    fontSize: 16,
                  )),
              Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ElevatedButton(
                    onPressed: () {
                      _launchURL(detailApp.appLink);
                    },
                    child: Text('Download'),
                  )),
            ],
          ),
        ));
  }
}

void _launchURL(String url) async {
  if (!await launch(url)) throw 'Could not launch $url';
}
