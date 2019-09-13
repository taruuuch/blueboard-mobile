import 'package:flutter/material.dart';

class AppStyle {
	// TODO: Global variables
  static const primaryPadding = 15.0;
  static const primaryColor = Colors.lightBlue;

	// TODO: Form variables
  static const formPadding = 15.0;

	// TODO: Button variables
	static const buttonBackground = Colors.blueGrey;
  static const buttonHeight = 42.0;
	static const buttonMinWidth = 100.0;

	// TODO: Trip variables
	static const tripItemPadding = 15.0;
	static const tripItemBorderRadius = 10.0;

	// TODO: Application theme
  static final ThemeData themeDataLight = new ThemeData(
    primaryColor: primaryColor,
    accentColor: Colors.lightBlueAccent,
    buttonColor: primaryColor,
    fontFamily: 'Montserrat',
    textTheme: TextTheme(
      headline: TextStyle(),
			subhead: TextStyle(),
      title: TextStyle(),
			subtitle: TextStyle(),
      body1: TextStyle(),
			body2: TextStyle(),
			display1: TextStyle(),
			display2: TextStyle(),
			display3: TextStyle(),
			display4: TextStyle(),
			button: TextStyle(),
    ),
  );
}