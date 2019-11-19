import 'package:flutter/material.dart';
import 'package:tolon_app/screens/login/page/LoginPage.dart';
import 'package:tolon_app/styles/TolonTheme.dart' as theme;
import 'package:intl/date_symbol_data_local.dart';

void main() => runApp(Tolon());

class Tolon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('es', null);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tolón',
      theme: theme.getThemeData(),
      home: LoginPage(),
    );
  }
}
