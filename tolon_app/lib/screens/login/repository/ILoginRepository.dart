import '../../home/models/Activity.dart';

abstract class ILoginRepository {
  Stream<bool> login(String username, String password);
  Stream<List<Activity>> getPublicActivities();
}