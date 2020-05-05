import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planets/Response.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

class DetailScreen extends StatelessWidget {
  Planet planet;
  DetailScreen(Planet planet) {
    this.planet = planet;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          CachedNetworkImage(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2,
            imageUrl: planet.image,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(planet.description,
                      style:
                          GoogleFonts.roboto(textStyle: TextStyle(fontSize: 18))),

                  Align(
                    alignment: FractionalOffset.bottomRight,
                    child: RichText(
                      text: TextSpan(
                        text: 'Read More',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20,
                            decoration: TextDecoration.underline),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            final url = Uri.encodeFull(planet.url);
                            if (await launcher.canLaunch(url)) {
                              await launcher.launch(
                                url,
                                forceSafariVC: true,
                                forceWebView: true,
                                headers: <String, String>{
                                  'my_header_key': 'my_header_value'
                                },
                              );
                            } else {
                              throw 'Could not launch $url';
                            }
                          },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
