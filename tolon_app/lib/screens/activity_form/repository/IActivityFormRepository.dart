import 'package:flutter/foundation.dart';

abstract class IActivityFormRepository {
  Future<void> join(String activityId, {@required bool willJoin});
}