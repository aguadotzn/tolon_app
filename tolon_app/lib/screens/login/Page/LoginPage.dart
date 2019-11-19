import 'package:flutter/material.dart';
import 'package:tolon_app/screens/home/HomeTabBar.dart';
import 'package:tolon_app/screens/home/feed/Page/HomeFeedPage.dart';
import 'package:tolon_app/screens/home/models/User.dart';
import 'package:tolon_app/screens/login/page/LoginPageIB.dart';
import '../viewModel/LoginPageViewModel.dart';
import '../viewModel/LoginViewModelInjector.dart';
import 'ILoginPage.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> implements ILoginPage {
  TextEditingController username;
  TextEditingController password;
  bool isEnable = false;

  LoginPageViewModel _viewModel;

  @override
  void initState() {
    _viewModel = LoginViewModelInjector.injectMockViewModel(this);

    username = TextEditingController();
    password = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => LoginPageIB.build(
      context, onPressed, onPressedSeeEvents, username, password);

  void onPressed() {
    FocusScope.of(context).unfocus();
    _viewModel.login(username.text, password.text);
  }

  void onPressedSeeEvents() {
    _viewModel.seePublicEvents();
  }

  @override
  void onLogin() {
    HomeTabBar tabBar;
    if (username.text.toLowerCase() == "jose") {
      tabBar = HomeTabBar(User(
        image: Image.asset("assets/images/users/avatar1.png"),
        name: "Jose Manuel Pérez",
        isSuperuser: true,
      ));
    } else {
      tabBar = HomeTabBar(User(
        image: Image.asset("assets/images/users/avatar2.png"),
        name: "Adrián Aguado",
        isSuperuser: false,
      ));
    }
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
      return tabBar;
    }));
  }

  @override
  void onError() {
    print("Error in login screen");
  }

  @override
  void onGetPublicActivities() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(
            title: Text("Actividades cerca de ti"),
          ),
          body: HomeFeedPage(
            User(
              image: Image.asset("assets/images/users/avatar2.png"),
              name: "Adrián Aguado",
            ),
            logged: false,
          ),
        ),
      ),
    );
  }
}
