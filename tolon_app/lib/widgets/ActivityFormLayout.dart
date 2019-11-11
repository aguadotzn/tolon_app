import 'package:flutter/material.dart';
import 'package:tolon_app/widgets/SectionLayout.dart';

class ActivityFormLayout extends StatelessWidget {
  const ActivityFormLayout({
    Key key,
    this.header,
    this.action,
    this.category,
    this.time,
    this.location,
    this.host,
    this.invited,
    this.body,
  }) : super(key: key);

  final Widget header;
  final Widget action;
  final Widget category;
  final Widget time;
  final Widget location;
  final Widget host;
  final Widget invited;
  final Widget body;

  @override
  Widget build(BuildContext context) => SectionLayout(
        header: header,
        body: ListView(
          children: <Widget>[
            if (action != null)
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
                child: action,
              ),
            if (category != null) category,
            if (time != null) time,
            if (location != null) location,
            if (host != null) host,
            if (body != null)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: body,
              ),
            if (invited != null) invited,
          ],
        ),
      );
}
