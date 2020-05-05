import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:planets/Detail.dart';

import 'PlanetList.dart';
import 'Response.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Planets',
      theme: ThemeData(
        primaryColor: Color(0xffF46430),
        scaffoldBackgroundColor: Color(0xffFAB297),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("PLANETS",
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 20,
                  color: Colors.black)),
        ),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Planet> planets = new List();
  @override
  void initState() {
    var plan = fetchPlanets();
    plan.then((p) => planets = p.planets);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
          child: ListView.builder(
        itemCount: planets.length,
        itemBuilder: (context, _index) => GestureDetector(
          child: PlanetItem(planet: planets[_index]),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailScreen(planets[_index])),
          ),
        ),
      )),
    );
  }
}

Future<Response> fetchPlanets() async {
  String endpoint = 'http://demo7957902.mockable.io/planets';
  var response = await http.get(endpoint);
  if (response.statusCode == 200) {
    return Response.fromJson(json.decode(response.body));
  } else {
    throw Exception("exception");
  }
}
