import 'package:flutter/widgets.dart';

import 'LoginNavControllerIB.dart';

class LoginNavController extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => LoginNavControllerState();
}

class LoginNavControllerState extends State<LoginNavController> {
  @override
  Widget build(BuildContext context) => LoginNavControllerIB.build(context);

}