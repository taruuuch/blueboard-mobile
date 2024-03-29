import 'package:flutter/material.dart';

class AppStyle {
	// TODO: Global variables
  static const primaryPadding = 15.0;
  static const primaryColor = Colors.lightBlue;
  static const secondaryColor = Colors.grey;

  // TODO: Splash variables
  static const splashLogoSize = 100.0;
  static TextStyle splashTextStyle = new TextStyle(
    fontSize: 20,
    color: Colors.white,
    fontWeight: FontWeight.w700,
  );

	// TODO: SignIn variables
  static const signInDividerPadding = 15.0;
  static const signInLogoSize = 100.0;

	// TODO: SignUp variables
  static const signUpLogoSize = 100.0;

  // TODO: First setup variables
  static const firstSetupLogoSize = 100.0;

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
    primaryColor: Colors.lightBlue,
    accentColor: Colors.lightBlueAccent,
    buttonColor: Colors.lightBlue,
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
    errorColor: Colors.redAccent,
  );
}