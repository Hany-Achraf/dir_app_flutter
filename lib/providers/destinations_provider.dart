import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/models/destination_model.dart';
import 'package:http/http.dart' as http;

class DestinationsProvider extends ChangeNotifier {
  List<Destination> _destinations = null;
  List<Destination> get destinations => _destinations;

  bool gotNextPage = false;
  int currentPageNumber = 1;

  void loadInitialDestinations() async {
    if (_destinations != null) {
      _destinations = null;
      currentPageNumber = 1;
    }

    var response = await http.get(
      Uri.parse('$api/destinations'),
      headers: {
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      gotNextPage = responseJson['next_page_url'] != null ? true : false;
      _destinations = [];
      List destinationsJson = responseJson['data'];
      destinationsJson.forEach((destinationJson) {
        _destinations.add(Destination.fromJson(destinationJson));
      });
    }

    notifyListeners();
  }

  Future<bool> loadMoreDestinations() async {
    if (!gotNextPage) return false;

    var response = await http.get(
      Uri.parse('$api/destinations?page=${++currentPageNumber}'),
      headers: {
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      gotNextPage = responseJson['next_page_url'] != null ? true : false;
      List destinationsJson = responseJson['data'];
      destinationsJson.forEach((destinationJson) {
        _destinations.add(Destination.fromJson(destinationJson));
      });
      notifyListeners();
    }

    return gotNextPage;
  }
}
