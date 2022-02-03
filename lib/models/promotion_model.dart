import 'package:plant_app/models/business_model.dart';

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
