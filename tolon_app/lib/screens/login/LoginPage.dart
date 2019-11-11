import 'package:flutter/material.dart';
import 'package:tolon_app/screens/home/HomeTabBar.dart';
import 'package:tolon_app/screens/home/feed/Page/HomeFeedPage.dart';
import 'package:tolon_app/screens/home/models/User.dart';
import 'package:tolon_app/screens/login/LoginPageIB.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  TextEditingController username;
  TextEditingController password;
  bool isEnable = false;

  @override
  void initState() {
    username = TextEditingController();
    password = TextEditingController();

    // if (!username.text.isEmpty && !password.text.isEmpty) {
    //   isEnable = true;
    // }
    super.initState();
  }

  @override
  Widget build(BuildContext context) =>
      LoginPageIB.build(context, onPressed, onSeeEvents, username, password);

  void onPressed() {
    FocusScope.of(context).unfocus();

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

  void onSeeEvents() {
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
