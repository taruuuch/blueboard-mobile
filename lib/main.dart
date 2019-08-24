import 'package:flutter/material.dart';
import 'package:blueboard/pages/home_screen.dart';
import 'package:blueboard/pages/intro_screen.dart';
import 'package:blueboard/pages/signup_screen.dart';
import 'package:blueboard/pages/signin_screen.dart';

var routes = <String, WidgetBuilder> {
  '/home'  : (BuildContext context) => HomePage(),
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
      home: SignInPage(),
      initialRoute: '/',
      routes: routes,
    );
}