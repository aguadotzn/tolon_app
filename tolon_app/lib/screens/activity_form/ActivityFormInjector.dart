import 'package:tolon_app/screens/activity_form/repository/ActivityFormRepository.dart';
import 'package:tolon_app/screens/activity_form/repository/IActivityFormRepository.dart';
import 'package:tolon_app/screens/activity_form/view_model/ActivityFormViewModel.dart';
import 'package:tolon_app/screens/activity_form/views/IActivityFormPage.dart';
import 'package:tolon_app/services/activities/MockActivityService.dart';

class ActivityFormInjector {
  static ActivityFormViewModel injectViewModel(IActivityFormPage view,
          {IActivityFormRepository repository}) =>
      ActivityFormViewModel(
        view,
        repository ?? ActivityFormRepository(MockActivityService()),
      );
}
