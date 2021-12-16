class Promotion {
  final int id;
  final String name;
  final String imgUrl;
  final String
      promotionProvider; // the name of the business offering this promotion
  final DateTime endDate;

  Promotion(
      {this.id, this.name, this.imgUrl, this.promotionProvider, this.endDate});
}

List<Promotion> promotions = [
  Promotion(
    id: 1,
    name: 'Pizza Hut Double The Fun On Every Delivery Ad',
    imgUrl:
        'https://i.pinimg.com/736x/7f/66/1a/7f661a4c7e60360e19cd839b272d5be0--pizza-hut-print-advertising.jpg',
    promotionProvider: 'Pizza Hut',
    endDate: DateTime.now(),
  ),
  Promotion(
    id: 2,
    name: 'Pizza Hut Double The Fun On Every Delivery Ad',
    imgUrl:
        'https://i.pinimg.com/736x/7f/66/1a/7f661a4c7e60360e19cd839b272d5be0--pizza-hut-print-advertising.jpg',
    promotionProvider: 'Pizza Hut',
    endDate: DateTime.now(),
  ),
  Promotion(
    id: 3,
    name: 'Pizza Hut Double The Fun On Every Delivery Ad',
    imgUrl:
        'https://i.pinimg.com/736x/7f/66/1a/7f661a4c7e60360e19cd839b272d5be0--pizza-hut-print-advertising.jpg',
    promotionProvider: 'Pizza Hut',
    endDate: DateTime.now(),
  ),
];
