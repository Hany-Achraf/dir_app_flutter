import 'package:flutter/material.dart';
import 'package:plant_app/models/event_model.dart';
import 'package:plant_app/providers/see_all_events_provider.dart';
import 'package:plant_app/screens/search/components/event_search_card.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SeeAllEvents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Event> events =
        Provider.of<SeeAllEventsProvider>(context, listen: true).events;

    RefreshController refreshController = RefreshController();
    return SmartRefresher(
      controller: refreshController,
      enablePullDown: false,
      enablePullUp: true,
      onLoading: () async {
        // load more, and return true if there is more to load and vice versa
        bool gotMoreEventsToLoad =
            await Provider.of<SeeAllEventsProvider>(context, listen: false)
                .loadMoreEvents();

        // if no more to load exeute the laodNoData() method on refreshController
        if (!gotMoreEventsToLoad) {
          refreshController.loadNoData();
        }
      },
      child: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {},
            child: Container(
                margin: const EdgeInsets.all(8.0),
                child: EventSearchCard(event: events[index])),
          );
        },
      ),
    );
  }
}
