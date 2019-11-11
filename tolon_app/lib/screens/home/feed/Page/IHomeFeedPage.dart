import 'package:tolon_app/screens/home/models/Activity.dart';

abstract class IHomeFeedPage {
  void onReceived(List<Activity> activities);
}