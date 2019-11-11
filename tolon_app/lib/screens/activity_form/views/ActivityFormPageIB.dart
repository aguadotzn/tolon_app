import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tolon_app/screens/home/models/User.dart';
import 'package:tolon_app/widgets/ActivityFormLayout.dart';
import 'package:tolon_app/widgets/ActivityHeader.dart';
import 'package:tolon_app/screens/home/models/Activity.dart';
import 'package:tolon_app/widgets/UserTile.dart';
import 'package:tolon_app/styles/TolonTheme.dart' as theme;

class ActivityFormPageIB {
  static Widget build(
    BuildContext context,
    Activity activity, {
    @required void Function() onJoinPressed,
    @required bool isJoined,
    @required User user,
  }) {
    final titleFormatter = DateFormat.yMMMMd("es");
    final subtitleFormatter = DateFormat.Hm();
    return Scaffold(
      appBar: AppBar(
        title: Text("Actividad"),
      ),
      body: ActivityFormLayout(
        header: ActivityHeader(
          image: activity.category.image,
          title: Text(
            activity.title,
            style: theme.headlineStyle(context),
          ),
        ),
        action: AnimatedSwitcher(
          duration: Duration(milliseconds: 350),
          switchInCurve: Curves.easeIn,
          switchOutCurve: Curves.easeIn,
          child: isJoined
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Te has apuntado a este evento."),
                    RaisedButton(
                      onPressed: onJoinPressed,
                      child: Text(
                        "Desapuntarse",
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                  ],
                )
              : SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: RaisedButton(
                    onPressed: onJoinPressed,
                    child: Text(
                      user.isSuperuser ? "Invitar a más personas" : "Apuntarse",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
        ),
        category: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: FlatButton(
            onPressed: () {},
            child: Text(
              "Proponer otra hora",
              style: TextStyle(color: theme.secondary),
            ),
          ),
        ),
        time: ListTile(
          leading: Icon(Icons.access_time),
          title: Text(titleFormatter.format(activity.date)),
          subtitle: Text(subtitleFormatter.format(activity.date)),
        ),
        location: ListTile(
          leading: Icon(Icons.location_on),
          title: Text(activity.location),
        ),
        host: ListTile(
          leading: Icon(Icons.person),
          title: Text(activity.host),
          trailing: activity.host == "Diego Rogel" || activity.host == "Andrea Colina"
              ? Icon(Icons.star, color: theme.secondary,)
              : null
          ,
        ),
        invited: activity.attendingUsers != null &&
                activity.attendingUsers.isNotEmpty
            ? _buildAttendingList(context, activity)
            : null,
        body: Text(activity.description),
      ),
    );
  }

  static Widget _buildAttendingList(BuildContext context, Activity activity) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
            child: Text(
                "${activity.attendingUsers.length} personas atenderán al evento",
                style: Theme.of(context).textTheme.title),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            physics: PageScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Column(
              children: activity.attendingUsers
                  .map((user) => UserTile(image: user.image, title: user.name))
                  .toList(),
            ),
          ),
        ],
      );
}
