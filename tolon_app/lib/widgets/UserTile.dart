import 'package:flutter/material.dart';
import 'package:tolon_app/styles/TolonTheme.dart' as theme;

const double kDiameter = 48;

class UserTile extends StatelessWidget {
  const UserTile({
    @required this.title,
    this.image,
    Key key,
  }) : super(key: key);

  final Image image;
  final String title;

  @override
  Widget build(BuildContext context) => SizedBox(
    width: MediaQuery.of(context).size.width,
    child: ListTile(
          leading: ClipOval(
            child: Container(
              height: kDiameter,
              width: kDiameter,
              color: theme.primary,
              child: image,
            ),
          ),
          title: Text(title),
        ),
  );
}
