import '../../screens/home/models/Activity.dart';
import 'ILoginService.dart';

class MockLoginService extends ILoginService {
  @override
  Future<bool> login(String username, String password) {
    return Future.value(false);
  }

  @override
  Future<List<Activity>> dowloadActivities() => Future.value([]);
}