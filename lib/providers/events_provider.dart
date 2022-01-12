import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/models/event_model.dart';
import 'package:http/http.dart' as http;

class EventsProvider extends ChangeNotifier {
  List<Event> _events = [];
  List<Event> get events => _events;

  bool gotNextPage = false;
  int currentPageNumber = 1;

  Future<bool> loadInitialEvents() async {
    if (_events.isEmpty) {
      var response = await http.get(
        Uri.parse('$api/events'),
        headers: {
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        var responseJson = json.decode(response.body);
        gotNextPage = responseJson['next_page_url'] != null ? true : false;
        List eventsJson = responseJson['data'];
        eventsJson.forEach((eventJson) {
          _events.add(Event.fromJson(eventJson));
        });
      }
    }
    return true;
  }

  Future<bool> loadMoreEvents() async {
    if (!gotNextPage) return false;

    var response = await http.get(
      Uri.parse('$api/events?page=${++currentPageNumber}'),
      headers: {
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      gotNextPage = responseJson['next_page_url'] != null ? true : false;
      List eventsJson = responseJson['data'];
      eventsJson.forEach((eventJson) {
        _events.add(Event.fromJson(eventJson));
      });
      notifyListeners();
    }

    return gotNextPage;
  }
}
