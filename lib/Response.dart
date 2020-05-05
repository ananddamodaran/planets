class Response {
  List<Planet> planets;

  Response({this.planets});

  factory Response.fromJson(Map<String , dynamic> result){
    return Response(
    planets: List.from(result['planets'])
        .map((pl) => Planet.fromJson(pl)).toList()
    );

  }
}

class Planet {
  int order;
  String name;
  String description;
  String image;
  String url;

  Planet({this.order, this.name, this.description, this.image, this.url});

  factory Planet.fromJson(Map<String, dynamic> planet) {
     return Planet(
         order: planet['order'],
         name: planet['name'],
         description: planet['description'],
         image: planet['image'],
         url: planet['url']);
  }
}
