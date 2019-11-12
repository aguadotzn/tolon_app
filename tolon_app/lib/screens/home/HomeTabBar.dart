import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tolon_app/screens/home/feed/Page/HomeFeedPage.dart';
import 'package:tolon_app/styles/TolonTheme.dart' as theme;
import 'package:tolon_app/screens/home/models/User.dart';

class HomeTabBar extends StatelessWidget {

  User user;

  HomeTabBar(this.user);

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Actividades cerca de ti",
              style: theme.titleStyleBright(context),
            ),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(text: "Novedades"),
                Tab(text: "Tus eventos"),
              ],
            ),
            actions: <Widget>[
              Stack(
                children: <Widget>[
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.person,
                      color: theme.secondary,
                      ),
                    ),
                  if (user.isSuperuser)
                  Positioned(
                    top: 4,
                    right: 4,
                    child: Icon(Icons.star, color: theme.secondary, size: 17,),
                  )
                ],
              )
            ],
          ),
          body: TabBarView(
            children: [
              HomeFeedPage(user),
              HomeFeedPage(
                user,
                personalized: true,
              ),
            ],
          ),
        ),
      );
}
