import 'package:tolon_app/screens/home/models/Activity.dart';

abstract class IActivityService {
  void add(Activity activity);
  List<Activity> getActivities();
}