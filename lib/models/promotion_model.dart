import 'business_model.dart';

class Promotion {
  final int id;
  final String name;
  final String description;
  final String imgPath;
  final DateTime endDate;
  final Business provider;

  Promotion({
    this.id,
    this.name,
    this.description,
    this.endDate,
    this.imgPath,
    this.provider,
  });

  factory Promotion.fromJson(Map<String, dynamic> parsedJson) {
    return Promotion(
      id: parsedJson['id'],
      name: parsedJson['name'],
      description: parsedJson['description'],
      imgPath: parsedJson['img_path'],
      endDate: DateTime.parse(parsedJson['end_date']),
      provider: Business(
        id: parsedJson['business']['id'],
        name: parsedJson['business']['name'],
      ),
    );
  }
}

List<Promotion> promotions = [
  Promotion(
    id: 1,
    name: 'Pizza Hut Double The Fun On Every Delivery',
    imgPath:
        'https://i.pinimg.com/736x/7f/66/1a/7f661a4c7e60360e19cd839b272d5be0--pizza-hut-print-advertising.jpg',
    provider: Business(id: 1, name: 'Pizza Hut'),
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    endDate: DateTime.now(),
  ),
  Promotion(
    id: 2,
    name: 'Adidas Malaysia Offer - 30% Off Yeezy Slides & Shoes',
    imgPath:
        'https://www.everydayonsales.com/wp-content/uploads/2020/10/Adidas-30-off-Promo-at-Grace-One-Sports.jpg',
    provider: Business(id: 1, name: 'Adidas'),
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    endDate: DateTime.now(),
  ),
  Promotion(
    id: 3,
    name: 'Jelajah Usahawan Digital (BOP)',
    imgPath:
        'https://th.bing.com/th/id/OIP.RGE2SUt53XdWQSLuSpcCyAHaHa?pid=ImgDet&rs=1',
    provider: Business(id: 1, name: 'Starbucks'),
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    endDate: DateTime.now(),
  ),
];
