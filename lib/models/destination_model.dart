import 'package:plant_app/models/activity_model.dart';

class Destination {
  String imageUrl;
  String name;
  String description;
  List<Activity> activities;

  Destination({
    this.imageUrl,
    this.name,
    this.description,
    this.activities,
  });
}

List<Activity> activities = [
  Activity(
    // imageUrl: 'assets/images/stmarksbasilica.png',
    imageUrl: 'assets/images/al-ikhsan.png',
    name: 'Al-Ikhsan Sports',
    type: 'Sightseeing Tour',
    startTimes: ['9:00 am', '11:00 am'],
    rating: 5,
    // price: 30,
  ),
  Activity(
    imageUrl: 'assets/images/sogo.png',
    name: 'Sogo',
    type: 'Sightseeing Tour',
    startTimes: ['11:00 pm', '1:00 pm'],
    rating: 4,
    // price: 210,
  ),
  Activity(
    imageUrl: 'assets/images/MRDIY.png',
    name: 'Mr D.I.Y',
    type: 'Sightseeing Tour',
    startTimes: ['12:30 pm', '2:00 pm'],
    rating: 3,
    // price: 125,
  ),
];

List<Destination> destinations = [
  Destination(
    // imageUrl: 'assets/images/venice.png',
    imageUrl: 'assets/images/mid-valley-jb.png',
    name: 'The Mall Mid Valley SouthKey',
    description: 'Visit Venice for an amazing and unforgettable adventure.',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/images/paris.png',
    name: 'Paris',
    description: 'Visit Paris for an amazing and unforgettable adventure.',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/images/newdelhi.png',
    name: 'New Delhi',
    description: 'Visit New Delhi for an amazing and unforgettable adventure.',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/images/saopaulo.png',
    name: 'Sao Paulo',
    description: 'Visit Sao Paulo for an amazing and unforgettable adventure.',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/images/newyork.png',
    name: 'New York City',
    description: 'Visit New York for an amazing and unforgettable adventure.',
    activities: activities,
  ),
];
