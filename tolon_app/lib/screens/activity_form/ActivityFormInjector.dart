import 'package:tolon_app/screens/activity_form/view_model/ActivityFormViewModel.dart';
import 'package:tolon_app/screens/activity_form/views/IActivityFormPage.dart';

class ActivityFormInjector {
  static ActivityFormViewModel injectViewModel(IActivityFormPage view) =>
      ActivityFormViewModel(view);
}
