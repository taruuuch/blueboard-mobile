import 'package:flutter/material.dart';
import 'package:blueboard/trip/trip_screen.dart';
import 'package:blueboard/intro/intro_screen.dart';
import 'package:blueboard/sign_up/signup_screen.dart';
import 'package:blueboard/sign_in/signin_screen.dart';

var routes = <String, WidgetBuilder> {
  '/trip'  : (BuildContext context) => TripPage(),
  '/intro' : (BuildContext context) => IntroPage(),
  '/signin': (BuildContext context) => SignInPage(),
  '/signup': (BuildContext context) => SignUpPage(),
};

void main() => runApp(
  App()
);

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
    new MaterialApp(
      theme: new ThemeData(
        primaryColor: Colors.lightBlue,
        accentColor : Colors.lightBlueAccent
      ),
      debugShowCheckedModeBanner: false,
      routes: routes,
      home: TripPage(),
    );
}