class Event {
  final int id;
  final String name;
  final String imgPath;
  final String organizer;
  final String description;
  final DateTime dateTime;

  Event({
    this.id,
    this.name,
    this.imgPath,
    this.organizer,
    this.description,
    this.dateTime,
  });

  factory Event.fromJson(Map<String, dynamic> parsedJson) {
    return Event(
      id: parsedJson['id'],
      name: parsedJson['name'],
      description: parsedJson['description'],
      organizer: parsedJson['organizer'],
      imgPath: parsedJson['img_path'],
      dateTime: DateTime.parse(parsedJson['date_time']),
    );
  }
}
