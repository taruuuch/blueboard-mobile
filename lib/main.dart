import 'package:blueboard/pages/home_screen.dart';
import 'package:blueboard/pages/intro_screen.dart';
import 'package:blueboard/pages/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:blueboard/pages/signin_screen.dart';

var routes = <String, WidgetBuilder> {
  '/home': (BuildContext context) => HomeScreen(),
  '/intro': (BuildContext context) => IntroScreen(),
  '/signin': (BuildContext context) => SignInScreen(),
  '/signup': (BuildContext context) => SignUpPage(),
};

void main() => runApp(
  App()
);

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.lightBlue,
        accentColor: Colors.lightBlueAccent
      ),
      debugShowCheckedModeBanner: false,
      home: SignInScreen(),
      routes: routes,
    );
  }
}