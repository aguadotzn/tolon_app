import '../../screens/home/models/Activity.dart';
import 'ILoginService.dart';

class LoginService extends ILoginService {
  @override
  Future<bool> login(String username, String password) {
    //TODO: add login service
  }

  @override
  Future<List<Activity>> dowloadActivities() {
    // TODO: implement dowloadActivitiesData
    return null;
  }
}