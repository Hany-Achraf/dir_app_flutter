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
  )
];
