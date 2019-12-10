import 'package:flutter/material.dart';
import '../page/ILoginPage.dart';
import '../repository/LoginRepository.dart';

class LoginPageViewModel {
  final ILoginPage view;
  final LoginRepository repository;

  LoginPageViewModel({@required this.view, @required this.repository});

  void login(String username, String password) {
    repository.login(username, password).listen((loggedIn) {
      if (loggedIn) {
        view.onLogin();
      } else {
        view.onError();
      }
    }, onError: (error) {
      view.onError();
    });
  }

  void seePublicEvents() {
    repository.getPublicActivities().listen((activities) {
      if (activities.length != 0) {
        view.onLogin();
      } else {
        view.onError();
      }
    }, onError: (error) {
      view.onError();
    });
  }

  void register() {
    // TODO: Implement Register behaviour 
    // Here, the user should navigate to the register form. 

    view.onErrorRegister();
  }
}
