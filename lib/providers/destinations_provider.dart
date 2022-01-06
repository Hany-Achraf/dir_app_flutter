import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/models/destination_model.dart';
import 'package:plant_app/services/dio.dart';

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

    Response response = await dio().get('/api/destinations');
    if (response.statusCode == 200) {
      gotNextPage = response.data['next_page_url'] != null ? true : false;
      List destinationsJson = response.data['data'];
      destinationsJson.forEach((i) {
        _destinations.add(Destination.fromJson(i));
      });
    }
    return true;
  }

  Future<bool> loadMoreDestinations() async {
    if (!gotNextPage) return false;

    Response response =
        await dio().get('/api/destinations?page=${++currentPageNumber}');

    if (response.statusCode == 200) {
      gotNextPage = response.data['next_page_url'] != null ? true : false;
      List destinationsJson = response.data['data'];
      destinationsJson.forEach((i) {
        _destinations.add(Destination.fromJson(i));
      });
      notifyListeners();
    }

    return gotNextPage;
  }
}
