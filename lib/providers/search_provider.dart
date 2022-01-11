import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:plant_app/constants.dart';
import 'package:plant_app/models/business_model.dart';
import 'package:plant_app/models/event_model.dart';
import 'package:plant_app/models/promotion_model.dart';

class SearchProvider extends ChangeNotifier {
  String _searchQuery;

  List<Promotion> _promotions = null;
  List<Event> _events = null;
  List<Business> _businesses = null;

  List<Promotion> get promotions => _promotions;
  List<Event> get events => _events;
  List<Business> get businesses => _businesses;

  void searchAll({@required String searchQuery}) async {
    _searchQuery = searchQuery;

    var response = await http.get(
      Uri.parse('$api/search?search_query=${_searchQuery}'),
      headers: {
        'Accept': 'application/json',
      },
    );

    Map<String, dynamic> responseJson = json.decode(response.body);

    print('Results: ${response.body}');

    if (response.statusCode == 200) {
      if (responseJson['promotions']['total'] > 0) {
        _promotions = [];
        List promotionsJson = responseJson['promotions']['data'];
        promotionsJson.forEach((promotionJson) {
          _promotions.add(Promotion.fromJson(promotionJson));
        });
      } else {
        _promotions = null;
      }

      if (responseJson['events']['total'] > 0) {
        _events = [];
        List eventsJson = responseJson['events']['data'];
        eventsJson.forEach((eventJson) {
          _events.add(Event.fromJson(eventJson));
        });
      } else {
        _events = null;
      }

      if (responseJson['businesses']['total'] > 0) {
        _businesses = [];
        List businessesJson = responseJson['businesses']['data'];
        businessesJson.forEach((businessJson) {
          _businesses.add(Business.fromJson(businessJson));
        });
      } else {
        _businesses = null;
      }

      notifyListeners();

      // print(
      //     'Promotions length: ${_promotions.length}\nEvents length: ${_events.length}\nBusinesses length: ${_businesses.length}\n');
    }
  }
}
