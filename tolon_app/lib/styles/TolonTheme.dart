import 'package:flutter/material.dart';

final primary = Color(0xff344955);
final primaryLight = Color(0xff82a5b5);
final primaryDark = Color(0xff232f34);

final secondary = Color(0xfff9aa33);
final secondaryLight = Color(0xfff9aa33);
final secondaryDark = Color(0xffcc8a27);

final fadedSecondary = secondaryDark.withOpacity(0.25);
final ghostSecondary = secondaryDark.withOpacity(0.1);

final hintText = primary.withOpacity(0.5);

const brightText = Colors.white;
const darkText = Colors.black;
final error = Colors.red[900];

TextStyle headlineStyle(BuildContext context) =>
    Theme.of(context).textTheme.headline.copyWith(fontWeight: FontWeight.w700);

TextStyle titleStyleBright(BuildContext context) =>
    Theme.of(context).textTheme.title.copyWith(
          fontWeight: FontWeight.w700,
          color: brightText,
        );

ThemeData getThemeData() => ThemeData(
    fontFamily: "Montserrat",
    splashColor: fadedSecondary,
    highlightColor: ghostSecondary,
    primaryColor: primary,
    backgroundColor: primaryLight,
    accentColor: secondary,
    buttonColor: secondary,
    cursorColor: secondary,
    hintColor: primary.withOpacity(0.5),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: secondary ),
    ),
    colorScheme: ColorScheme(
      primary: primary,
      primaryVariant: primaryLight,
      secondary: secondary,
      secondaryVariant: secondaryDark,
      surface: primaryDark,
      background: primaryLight,
      error: error,
      onPrimary: brightText,
      onSecondary: darkText,
      onSurface: brightText,
      onBackground: darkText,
      onError: brightText,
      brightness: Brightness.dark,
    ),
    textTheme: TextTheme(
      button: TextStyle(color: primaryDark),
    ));
