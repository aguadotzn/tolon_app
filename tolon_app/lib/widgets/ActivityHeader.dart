import 'package:flutter/material.dart';
import 'package:tolon_app/styles/TolonTheme.dart' as theme;

class ActivityHeader extends StatelessWidget {
  const ActivityHeader({@required this.title, this.image, Key key})
      : super(key: key);

  final Widget title;
  final Image image;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            ClipOval(
              child: Container(
                height: 98,
                width: 98,
                color: theme.primary,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: image,
                ),
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: title,
            ),
          ],
        ),
      );
}
