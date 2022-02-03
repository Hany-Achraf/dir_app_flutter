import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:plant_app/constants.dart';
import 'package:plant_app/models/business_model.dart';
import 'package:plant_app/models/event_model.dart';
import 'package:plant_app/models/promotion_model.dart';
import 'package:plant_app/services/auth.dart';

class SearchProvider extends ChangeNotifier {
  final Auth auth;
  SearchProvider({@required this.auth});

  String _searchQuery;
  String get searchQuery => _searchQuery;

  int _totalPromotions = 0;
  int get totalPromotions => _totalPromotions;
  List<Promotion> _promotions = [];
  List<Promotion> get promotions => _promotions;

  int _totalEvents = 0;
  int get totalEvents => _totalEvents;
  List<Event> _events = [];
  List<Event> get events => _events;

  int _totalBusinesses = 0;
  int get totalBusinesses => _totalBusinesses;
  List<Business> _businesses = [];
  List<Business> get businesses => _businesses;

  void searchAll({@required String searchQuery}) async {
    _searchQuery = searchQuery;

    var response = await http.get(
      Uri.parse('$api/search?search_query=${_searchQuery}'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${auth.token}',
      },
    );

    Map<String, dynamic> responseJson = json.decode(response.body);

    if (response.statusCode == 200) {
      _totalPromotions = responseJson['promotions']['total'];
      if (_totalPromotions > 0) {
        _promotions.clear();
        promotions
            .add(Promotion.fromJson(responseJson['promotions']['data'][0]));
      } else {
        _promotions.clear();
      }

      _totalEvents = responseJson['events']['total'];
      if (_totalEvents > 0) {
        _events.clear();
        _events.add(Event.fromJson(responseJson['events']['data'][0]));
      } else {
        _events.clear();
      }

      _totalBusinesses = responseJson['businesses']['total'];
      if (_totalBusinesses > 0) {
        _businesses.clear();
        List businessesJson = responseJson['businesses']['data'];
        businessesJson.forEach((businessJson) {
          _businesses.add(Business.fromJson(businessJson));
        });
      } else {
        _businesses.clear();
      }

      notifyListeners();
    }
  }

  void clearSearchResults() {
    _totalBusinesses = 0;
    _businesses.clear();

    _totalPromotions = 0;
    _promotions.clear();

    _totalEvents = 0;
    _events.clear();

    notifyListeners();
  }
}
