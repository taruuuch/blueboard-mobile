import 'package:blueboard/services/navigation.dart';
import 'package:flutter/material.dart';
import 'pages/trips/trips_screen.dart';
import 'pages/sign_up/sign_up_screen.dart';
import 'pages/sign_in/sign_in_screen.dart';

void main() {
  setupLocator();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
    new MaterialApp(
      theme: new ThemeData(
        primaryColor: Colors.lightBlue,
        accentColor : Colors.lightBlueAccent
      ),
      debugShowCheckedModeBanner: false,
      navigatorKey: locator<NavigationService>().navigatorKey,
      onGenerateRoute: (routeSettings) {
        switch (routeSettings.name) {
          case 'sign-in':
            return MaterialPageRoute(builder: (context) => SignInPage());
            break;
          case 'sign-up':
            return MaterialPageRoute(builder: (context) => SignUpPage());
            break;
          case 'trips':
            return MaterialPageRoute(builder: (context) => TripPage());
            break;
          default:
            return MaterialPageRoute(builder: (context) => SignInPage());
            break;
        }
      },
      home: SignInPage(),
    );
}