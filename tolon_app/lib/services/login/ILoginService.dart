import '../../screens/home/models/Activity.dart';

abstract class ILoginService { 
  Future<bool> login(String username, String password); 
  Future<List<Activity>> dowloadActivities(); 
}