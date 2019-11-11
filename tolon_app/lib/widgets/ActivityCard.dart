import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tolon_app/screens/home/models/ActivityCategory.dart';
import 'package:tolon_app/styles/TolonTheme.dart' as theme;

class ActivityCard {
  bool isExpanded = false;
  String title = "";
  String description;
  String location;
  DateTime dateTime;
  ActivityCategory category;
  String creator;
  BuildContext context;

  ActivityCard(this.title, this.description, this.context, this.location,
      this.dateTime, this.category, this.creator);

  static Widget buildHeader(String title, DateTime dateTime, String location,
      ActivityCategory category, bool isSuperUser, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 16.0, left: 8.0),
              child: Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  CircleAvatar(
                    child: Container(
                      child: category.image,
                      width: 40,
                    ),
                    radius: 25,
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  if (isSuperUser)
                    Positioned(
                      top: -5,
                      right: -5,
                      child: Icon(
                        Icons.star,
                        color: theme.secondary,
                        size: 25,
                      ),
                    )
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(title,
                      overflow: TextOverflow.fade,
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.left),
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.location_on,
                            size: 12,
                            color: Theme.of(context).primaryColor,
                          ),
                          SizedBox(width: 3),
                          Text(
                            location,
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.grey, fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.calendar_today,
                              size: 12, color: Theme.of(context).primaryColor),
                          SizedBox(width: 3),
                          Text(
                            DateFormat("dd-MM-yyyy").format(dateTime),
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.grey, fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static Widget buildBody(String description, String creator, bool isSuperUser,
      BuildContext context, Function() onSeeMorePressed) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _descriptionText(description),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _creatorInfo(creator, isSuperUser, context),
              Container(
                width: 160,
                padding: EdgeInsets.all(20),
                child: RaisedButton(
                  child: Text(
                    "Ver detalles",
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: onSeeMorePressed,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  static Widget _descriptionText(String description) {
    if (description == "") {
      return Container();
    } else {
      return Padding(
        padding: const EdgeInsets.only(bottom: 3.0),
        child: Text(
          description,
          textAlign: TextAlign.left,
          maxLines: 8,
          style: TextStyle(height: 1.2, fontSize: 12),
        ),
      );
    }
  }

  static Widget _creatorInfo(
      String creator, bool isSuperUser, BuildContext context) {
    return Row(
      children: <Widget>[
        Stack(
          overflow: Overflow.visible,
          children: [
            CircleAvatar(
              radius: 16,
              backgroundColor: Theme.of(context).primaryColor,
              child: Container(
                child: _avatarCategory(),
                width: 35,
              ),
            ),
            if (isSuperUser)
              Positioned(
                top: -4,
                right: -4,
                child: Icon(
                  Icons.star,
                  color: theme.secondary,
                  size: 17,
                ),
              )
          ],
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          creator,
          style: TextStyle(fontSize: 12),
        )
      ],
    );
  }

  static Image _avatarCategory() {
    final random = Random();
    int newRandom;
    do {
      newRandom = random.nextInt(6);
    } while (newRandom == 0);

    return Image.asset(
      "assets/images/users/avatar" + newRandom.toString() + ".png",
      color: Colors.white,
    );
  }
}
