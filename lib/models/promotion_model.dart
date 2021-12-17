class Promotion {
  final int id;
  final String name;
  final String imgUrl;
  final String
      promotionProvider; // the name of the business offering this promotion
  final String description;
  final DateTime endDate;

  Promotion(
      {this.id,
      this.name,
      this.imgUrl,
      this.promotionProvider,
      this.description,
      this.endDate});
}

List<Promotion> promotions = [
  Promotion(
    id: 1,
    name: 'Pizza Hut Double The Fun On Every Delivery',
    imgUrl:
        'https://i.pinimg.com/736x/7f/66/1a/7f661a4c7e60360e19cd839b272d5be0--pizza-hut-print-advertising.jpg',
    promotionProvider: 'Pizza Hut',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    endDate: DateTime.now(),
  ),
  Promotion(
    id: 2,
    name: 'Adidas Malaysia Offer - 30% Off Yeezy Slides & Shoes',
    imgUrl:
        'https://www.everydayonsales.com/wp-content/uploads/2020/10/Adidas-30-off-Promo-at-Grace-One-Sports.jpg',
    promotionProvider: 'Adidas',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    endDate: DateTime.now(),
  ),
  Promotion(
    id: 3,
    name: 'Starbucks Drink Extra 20% Off April Fools Promo',
    imgUrl:
        'https://th.bing.com/th/id/OIP.RGE2SUt53XdWQSLuSpcCyAHaHa?pid=ImgDet&rs=1',
    promotionProvider: 'Starbucks',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    endDate: DateTime.now(),
  ),
];
