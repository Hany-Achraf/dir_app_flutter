import 'business_model.dart';

class Destination {
  int id;
  String name;
  String imgUrl;
  List<Business> businesses = [];

  Destination({
    this.id,
    this.name,
    this.imgUrl,
  });
}

List<Destination> destinations = [
  Destination(
    id: 1,
    name: 'The Mall Mid Valley SouthKey',
    imgUrl: 'assets/images/mid-valley-jb.png',
  ),
  Destination(
    id: 2,
    name: 'New York',
    imgUrl: 'assets/images/newyork.png',
  ),
  Destination(
    id: 3,
    name: 'Paris',
    imgUrl: 'assets/images/paris.png',
  ),
  Destination(
    id: 4,
    name: 'Santorini',
    imgUrl: 'assets/images/santorini.png',
  ),
  Destination(
    id: 5,
    name: 'Saopaulo',
    imgUrl: 'assets/images/saopaulo.png',
  ),
];
