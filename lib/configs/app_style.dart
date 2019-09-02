import 'package:flutter/material.dart';

class AppStyle {
  static const primaryPadding = 15.0;
  static const primaryColor = Colors.lightBlue;
  static const buttonHeight = 42.0;
  static const formPadding = 15.0;

  static final ThemeData themeDataLight = new ThemeData(
    primaryColor: primaryColor,
    accentColor: Colors.lightBlueAccent,
    buttonColor: primaryColor,
    // fontFamily: 'Montserrat',
    textTheme: TextTheme(
      headline: TextStyle(),
      title: TextStyle(),
      body1: TextStyle(),
    ),
  );
}