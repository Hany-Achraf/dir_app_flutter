import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/models/event_model.dart';
import 'package:plant_app/services/dio.dart';

class EventsProvider extends ChangeNotifier {
  List<Event> _events = [];
  List<Event> get events => _events;

  bool gotNextPage = false;
  int currentPageNumber = 1;

  Future<bool> loadInitialEvents() async {
    if (_events.isEmpty) {
      Response response = await dio().get('/api/events');
      if (response.statusCode == 200) {
        gotNextPage = response.data['next_page_url'] != null ? true : false;
        List eventsJson = response.data['data'];
        eventsJson.forEach((i) {
          _events.add(Event.fromJson(i));
        });
      }
    }
    return true;
  }

  Future<bool> loadMoreEvents() async {
    if (!gotNextPage) return false;

    Response response =
        await dio().get('/api/events?page=${++currentPageNumber}');

    if (response.statusCode == 200) {
      gotNextPage = response.data['next_page_url'] != null ? true : false;
      List eventsJson = response.data['data'];
      eventsJson.forEach((i) {
        _events.add(Event.fromJson(i));
      });
      notifyListeners();
    }

    return gotNextPage;
  }
}
