import 'package:flutter/foundation.dart';
import 'package:tolon_app/screens/activity_form/repository/IActivityFormRepository.dart';
import 'package:tolon_app/services/activities/IActivityService.dart';

class ActivityFormRepository implements IActivityFormRepository {
  ActivityFormRepository(this._activities);

  final IActivityService _activities;

  @override
  Future<void> join(String activityId, {@required bool willJoin}) async {
    // TODO: implement join
  }
}