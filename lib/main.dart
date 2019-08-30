import 'package:blueboard/pages/sign_in/sign_in_page.dart';
import 'package:blueboard/pages/sign_up/sign_up_page.dart';
import 'package:blueboard/services/navigation.dart';
import 'package:flutter/material.dart';
import 'pages/trips/trips_screen.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) => new MaterialApp(
        theme: new ThemeData(
            primaryColor: Colors.lightBlue,
            accentColor: Colors.lightBlueAccent),
        debugShowCheckedModeBanner: false,
        navigatorKey: NavigationService.navigatorKey,
        onGenerateRoute: (routeSettings) {
          switch (routeSettings.name) {
            case SignInPage.tag:
              return MaterialPageRoute(builder: (context) => SignInPage());
              break;
            case SignUpPage.tag:
              return MaterialPageRoute(builder: (context) => SignUpPage());
              break;
            case TripPage.tag:
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
