import 'package:flutter/material.dart';
import 'package:tolon_app/screens/home/models/ActivityCategory.dart';
import 'package:tolon_app/screens/home/models/User.dart';

class Activity {
  final String id;
  final String title;
  final String description;
  final DateTime date;
  final String location;
  final String host;
  final ActivityCategory category;
  final List<User> attendingUsers;

  Activity({
    @required this.description,
    @required this.category,
    @required this.title,
    @required this.date,
    @required this.location,
    @required this.host,
    this.id,
    this.attendingUsers = const [],
  });
}
