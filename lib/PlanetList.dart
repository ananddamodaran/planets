import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'Response.dart';

class PlanetItem extends StatelessWidget {
  final Planet planet;
  PlanetItem({this.planet});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              planet.name.toUpperCase(),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              maxLines: 1,
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                            ),
                            Text(
                              planet.description,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              maxLines: 2,
                              style: TextStyle(fontStyle: FontStyle.normal, fontSize: 16),
                            )
                          ],
                        ),
                      ),
                    ),
                  ]),
            ),
            Container(
              height: 100,
              width: 100,
              child: CachedNetworkImage(
                placeholder: (context, url) => SizedBox(
                    child: CircularProgressIndicator(),
                  width: 50,
                    height: 50,

                ),
                imageUrl: planet.image,
                fit: BoxFit.cover
              ),
            ),
          ],
        ));
  }
}
