import 'package:flutter/foundation.dart';
import 'package:tolon_app/screens/activity_form/repository/IActivityFormRepository.dart';
import 'package:tolon_app/screens/activity_form/views/IActivityFormPage.dart';
import 'package:tolon_app/screens/home/models/Activity.dart';

class ActivityFormViewModel {
  const ActivityFormViewModel(this._view, this._repository);

  final IActivityFormPage _view;
  final IActivityFormRepository _repository;

  void join(Activity activity, {@required bool isCurrentlyJoined}) async {
    final willJoin = !isCurrentlyJoined;
    await _repository.join(activity.id, willJoin: willJoin);
    _view.onActivityJoined(willJoin);
  }
}