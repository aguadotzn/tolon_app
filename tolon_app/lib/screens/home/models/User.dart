import 'package:flutter/material.dart';

class User {
  const User({
    this.image,
    @required this.name,
    this.telephone,
    this.isSuperuser = false,
  });

  final Image image;
  final String name;
  final int telephone;
  final bool isSuperuser;

  @override
  bool operator ==(other) => other is User && other.name == name;

  @override
  int get hashCode => super.hashCode;
}
