import 'package:flutter/material.dart';
import 'package:tolon_app/screens/home/feed/Page/IHomeFeedPage.dart';
import 'package:tolon_app/screens/home/models/Activity.dart';
import 'package:tolon_app/screens/home/models/User.dart';
import 'package:tolon_app/services/activities/IActivityService.dart';
import 'package:tolon_app/widgets/ActivityCard.dart';

class HomeFeedViewModel {
  const HomeFeedViewModel(
    this.view, {
    @required this.activitiesService,
    this.personalized = false,
  });

  final bool personalized;
  final IActivityService activitiesService;
  final IHomeFeedPage view;

  void loadActivities() {
    final activities = activitiesService.getActivities();
    view.onReceived(activities);
  }

  List<ActivityCard> buildCards(
      List<Activity> activities, BuildContext context) {
    if (personalized) {
      final filtered = activities
          .where((activity) =>
              activity.attendingUsers.contains(User(name: "Adrián")))
          .toList();
      final cards = List<ActivityCard>.generate(
        filtered.length,
        (int i) => ActivityCard(
          filtered[i].title,
          (filtered[i].description == null ? "" : filtered[i].description),
          context,
          filtered[i].location,
          filtered[i].date,
          filtered[i].category,
          filtered[i].host,
        ),
      );
      return cards;
    } else {
      final cards = List<ActivityCard>.generate(
        activities.length,
        (int i) => ActivityCard(
          activities[i].title,
          (activities[i].description == null ? "" : activities[i].description),
          context,
          activities[i].location,
          activities[i].date,
          activities[i].category,
          activities[i].host,
        ),
      );
      return cards;
    }
  }
}
