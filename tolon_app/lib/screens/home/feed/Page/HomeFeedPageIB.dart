import 'package:flutter/material.dart';
import 'package:tolon_app/screens/home/models/Activity.dart';
import 'package:tolon_app/widgets/ActivityCard.dart';

class HomeFeedPageIB {
  static Widget build(
    BuildContext context,
    List<ActivityCard> cards,
    List<Activity> activities,
    bool isExpanded,
    void Function(int index, bool isExpanded) expansionCallback,
    void Function(Activity) onSeeMorePressed,
    bool personalized,
    bool logged,
    Function onAddActivity,
  ) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: <Widget>[
          ExpansionPanelList(
            expansionCallback: expansionCallback,
            children: cards.map((ActivityCard activity) {
              bool isSuperUser = activity.creator == "Diego Rogel" ||
                  activity.creator == "Andrea Colina";

              return ExpansionPanel(
                  isExpanded: activity.isExpanded,
                  canTapOnHeader: true,
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return ActivityCard.buildHeader(
                      activity.title,
                      activity.dateTime,
                      activity.location,
                      activity.category,
                      isSuperUser,
                      context,
                    );
                  },
                  body: ActivityCard.buildBody(
                    activity.description,
                    activity.creator,
                    isSuperUser,
                    context,
                    () => onSeeMorePressed(activities[cards.indexOf(activity)]),
                  ));
            }).toList(),
          ),
        ],
      ),
      floatingActionButton: logged
          ? FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () => onAddActivity(),
            )
          : null,
    );
  }
}
