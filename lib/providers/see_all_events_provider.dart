import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:plant_app/constants.dart';
import 'package:plant_app/models/event_model.dart';

class SeeAllEventsProvider extends ChangeNotifier {
  String searchQuery;

  List<Event> _events = [];
  List<Event> get events => _events;

  bool gotNextPage = false;
  int currentPageNumber = 0;

  Future<bool> seeAllEvents({@required String searchQuery}) async {
    searchQuery = searchQuery;

    if (_events.isNotEmpty) {
      _events.clear();
      currentPageNumber = 1;
    }

    var response = await http.get(
      Uri.parse('$api/events/search?search_query=${searchQuery}'),
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
    return true;
  }

  Future<bool> loadMoreEvents() async {
    if (!gotNextPage) return false;

    var response = await http.get(
      Uri.parse(
          '$api/events/search?search_query=${this.searchQuery}&page=${++currentPageNumber}'),
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
