import 'package:flutter/material.dart';
import 'package:tolon_app/screens/home/HomeTabBar.dart';
import 'package:tolon_app/screens/home/feed/Page/HomeFeedPage.dart';
import 'package:tolon_app/screens/home/models/User.dart';
import '../page/ILoginPage.dart';
import '../page/LoginPageIB.dart';
import '../viewModel/LoginPageViewModel.dart';
import '../viewModel/LoginViewModelInjector.dart';

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
    _enableLoginButton();
    _viewModel = LoginViewModelInjector.injectMockViewModel(this);
    username = TextEditingController();
    password = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => LoginPageIB.build(context, onPressed, onPressedSeeEvents, username, password, _enableLoginButton,isEnable);

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
    _showAlertDialog(context);
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

  void _showAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (buildcontext) {
          return AlertDialog(
            title: Text("No se ha podido iniciar sesión."),
          );
        });
  }

  void _enableLoginButton() {
    if((username.text.isNotEmpty) && (password.text.isNotEmpty)){
        setState(() {
          isEnable = true;
        });
    } else {
      setState(() {
        isEnable = false;
      });
    }
  }
}
