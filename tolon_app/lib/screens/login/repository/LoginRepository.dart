import 'package:flutter/material.dart';
import '../../../services/login/ILoginService.dart';
import '../../home/models/Activity.dart';
import 'ILoginRepository.dart';

class LoginRepository extends ILoginRepository {
  final ILoginService service;

  LoginRepository({@required this.service});

  @override
  Stream<bool> login(String username, String password) => service.login(username, password).asStream();

  @override
  Stream<List<Activity>> getPublicActivities() => service.dowloadActivities().asStream();

}