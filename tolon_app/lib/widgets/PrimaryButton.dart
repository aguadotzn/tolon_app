import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final Function onPressed;

  PrimaryButton({@required this.title, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        disabledColor: Colors.grey,
        child: Text(title),
        textColor: Colors.white,
        onPressed: onPressed);
  }
}
