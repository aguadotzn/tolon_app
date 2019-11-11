import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tolon_app/screens/activity_form/views/ActivityFormPage.dart';
import 'package:tolon_app/screens/add_activity/Page/AddActivityPage.dart';
import 'package:tolon_app/screens/home/feed/HomeFeedInjector.dart';
import 'package:tolon_app/screens/home/feed/Page/IHomeFeedPage.dart';
import 'package:tolon_app/screens/home/feed/ViewModel/HomeFeedViewModel.dart';
import 'package:tolon_app/screens/home/models/User.dart';
import 'package:tolon_app/widgets/ActivityCard.dart';
import 'HomeFeedPageIB.dart';
import '../../models/Activity.dart';

class HomeFeedPage extends StatefulWidget {
  const HomeFeedPage(
    this.user, {
    Key key,
    this.personalized = false,
    this.logged = true,
  }) : super(key: key);

  final bool personalized;
  final bool logged;
  final User user;

  @override
  State<StatefulWidget> createState() => HomeFeedPageState();
}

class HomeFeedPageState extends State<HomeFeedPage> implements IHomeFeedPage {
  List<Activity> activities;
  HomeFeedViewModel viewModel;
  bool isExpanded = false;
  List<ActivityCard> cards = [];

  @override
  void initState() {
    viewModel = HomeFeedInjector.injectViewModel(this,
        personalized: widget.personalized);
    viewModel.loadActivities();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => HomeFeedPageIB.build(
        context,
        cards,
        activities,
        isExpanded,
        onExpansionChanged,
        onPressed,
        widget.personalized,
        widget.logged,
        onAddActivity,
      );

  void onExpansionChanged(int index, bool isExpanded) {
    setState(() {
      cards[index].isExpanded = !isExpanded;
    });
  }

  void onPressed(Activity activity) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ActivityFormPage(
          activity,
          widget.user,
        ),
      ),
    );
  }

  void onAddActivity() {
    Navigator.of(context)
        .push(MaterialPageRoute(
            builder: (context) => AddActivityPage(widget.user)))
        .then(
          (value) => viewModel.loadActivities(),
        );
  }

  @override
  void onReceived(List<Activity> activities) {
    setState(() {
      cards = viewModel.buildCards(activities, context);
      this.activities = activities;
    });
  }
}
