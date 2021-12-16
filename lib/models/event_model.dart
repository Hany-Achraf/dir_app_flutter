class Event {
  final int id;
  final String name;
  final String imgUrl;
  final String organizer;
  final DateTime date;

  Event({this.id, this.name, this.imgUrl, this.organizer, this.date});
}

List<Event> events = [
  Event(
    id: 1,
    name: 'Everyday Parenting: The ABCs of Child Rearing',
    imgUrl: 'https://savorsunsets.com/wp-content/uploads/2019/04/IMG_1891.jpg',
    organizer: 'Sogo',
    date: DateTime.now(),
  ),
  Event(
    id: 2,
    name: 'Everyday Parenting: The ABCs of Child Rearing',
    imgUrl: 'https://savorsunsets.com/wp-content/uploads/2019/04/IMG_1891.jpg',
    organizer: 'Sogo',
    date: DateTime.now(),
  ),
  Event(
    id: 3,
    name: 'Everyday Parenting: The ABCs of Child Rearing',
    imgUrl: 'https://savorsunsets.com/wp-content/uploads/2019/04/IMG_1891.jpg',
    organizer: 'Sogo',
    date: DateTime.now(),
  ),
];
