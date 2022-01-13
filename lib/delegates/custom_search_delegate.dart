import 'package:flutter/material.dart';
import 'package:plant_app/providers/search_provider.dart';
import 'package:plant_app/screens/search/search_all_results.dart';
import 'package:provider/provider.dart';

class CustomSearchDelegate extends SearchDelegate {
  String prevQuery = '';

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        tooltip: 'Clear',
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (prevQuery != query) {
      Provider.of<SearchProvider>(context, listen: false)
          .searchAll(searchQuery: query);
      prevQuery = query;
    }

    return searchAllResults(context: context);
  }

  @override
  Widget buildResults(BuildContext context) {
    return null;
  }

  @override
  void close(BuildContext context, result) {
    Provider.of<SearchProvider>(context, listen: false).clearSearchResults();
    super.close(context, result);
  }
}
