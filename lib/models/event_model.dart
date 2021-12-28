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

List<Event> events = [
  Event(
    id: 1,
    name: 'SUN LIFE MALAYSIA RESOLUTION RUN 2020',
    imgPath:
        'https://www.heyjom.com/events/imgs/sunlife-run-2020-heyjom-20190822-02.jpg',
    organizer: 'Sun Life Malaysia Assurance Bhd',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    dateTime: DateTime.now(),
  ),
  Event(
    id: 2,
    name:
        'HOW 2022 BUDGET AFFECT YOUR BUSINESS AND PERSONAL INCOME [FREE ADMISSION]',
    imgPath:
        'https://img.evbuc.com/https%3A%2F%2Fcdn.evbuc.com%2Fimages%2F200754299%2F221365573502%2F1%2Foriginal.20211214-131741?w=800&auto=format%2Ccompress&q=75&sharp=10&rect=0%2C0%2C1080%2C540&s=3257d273f20fdb142787d1412e65d320',
    organizer: 'KENT LIEW',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    dateTime: DateTime.now(),
  ),
  Event(
    id: 3,
    name: 'Jelajah Usahawan Digital (BOP)',
    imgPath:
        'https://img.evbuc.com/https%3A%2F%2Fcdn.evbuc.com%2Fimages%2F195802749%2F682100945003%2F1%2Foriginal.20211203-124302?w=800&auto=format%2Ccompress&q=75&sharp=10&rect=0%2C0%2C1080%2C540&s=e6d0626cecb793565670866f6d55c3d3',
    organizer: 'Halo Telco',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    dateTime: DateTime.now(),
  ),
];
