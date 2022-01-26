import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/models/event_model.dart';
import 'package:http/http.dart' as http;
import 'package:plant_app/services/auth.dart';

class EventsProvider extends ChangeNotifier {
  final Auth auth;
  EventsProvider({@required this.auth});

  List<Event> _events = null;
  List<Event> get events => _events;

  bool gotNextPage = false;
  int currentPageNumber = 1;

  void loadInitialEvents() async {
    if (_events != null) {
      _events = null;
      currentPageNumber = 1;
    }

    log('$api/events');

    var response = await http.get(
      Uri.parse('$api/events'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${auth.token}',
      },
    );

    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      gotNextPage = responseJson['next_page_url'] != null ? true : false;
      _events = [];
      List eventsJson = responseJson['data'];
      eventsJson.forEach((eventJson) {
        _events.add(Event.fromJson(eventJson));
      });

      notifyListeners();
    }
  }

  Future<bool> loadMoreEvents() async {
    if (!gotNextPage) return false;

    log('$api/events?page=${currentPageNumber + 1}');

    var response = await http.get(
      Uri.parse('$api/events?page=${++currentPageNumber}'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${auth.token}',
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
