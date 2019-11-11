import 'package:tolon_app/screens/home/feed/Page/IHomeFeedPage.dart';
import 'package:tolon_app/screens/home/feed/ViewModel/HomeFeedViewModel.dart';
import 'package:tolon_app/services/activities/MockActivityService.dart';

class HomeFeedInjector {
  static HomeFeedViewModel injectViewModel(
          IHomeFeedPage view, {bool personalized}) =>
      HomeFeedViewModel(
        view,
        activitiesService: MockActivityService(),
        personalized: personalized,
      );
}
