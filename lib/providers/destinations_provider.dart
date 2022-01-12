import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/models/destination_model.dart';
import 'package:http/http.dart' as http;

class DestinationsProvider extends ChangeNotifier {
  List<Destination> _destinations = [];
  List<Destination> get destinations => _destinations;

  bool gotNextPage = false;
  int currentPageNumber = 1;

  Future<bool> loadInitialDestinations() async {
    if (_destinations.isNotEmpty) {
      _destinations = [];
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
      List destinationsJson = responseJson['data'];
      destinationsJson.forEach((destinationJson) {
        _destinations.add(Destination.fromJson(destinationJson));
      });
    }
    return true;
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
