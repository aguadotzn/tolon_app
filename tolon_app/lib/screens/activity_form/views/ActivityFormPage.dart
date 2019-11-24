import 'package:flutter/material.dart';
import 'package:tolon_app/screens/activity_form/ActivityFormInjector.dart';
import 'package:tolon_app/screens/activity_form/view_model/ActivityFormViewModel.dart';
import 'package:tolon_app/screens/activity_form/views/ActivityFormPageIB.dart';
import 'package:tolon_app/screens/activity_form/views/IActivityFormPage.dart';
import 'package:tolon_app/screens/home/models/Activity.dart';
import 'package:tolon_app/screens/home/models/User.dart';

class ActivityFormPage extends StatefulWidget {
  const ActivityFormPage(this.activity, this.user, {Key key}) : super(key: key);

  final Activity activity;
  final User user;

  @override
  _ActivityFormPageState createState() => _ActivityFormPageState();
}

class _ActivityFormPageState extends State<ActivityFormPage>
    implements IActivityFormPage {
  ActivityFormViewModel _viewModel;
  bool isJoined = false;

  @override
  void initState() {
    ActivityFormInjector.injectViewModel(this);
    super.initState();
  }

  void _onJoinPressed() => _viewModel.join(widget.activity);

  @override
  Widget build(BuildContext context) => ActivityFormPageIB.build(
        context,
        widget.activity,
        isJoined: isJoined,
        onJoinPressed: _onJoinPressed,
        user: widget.user,
      );

  @override
  void onActivityJoined() => setState(() => isJoined = !isJoined);
}
