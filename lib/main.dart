import 'package:blueboard/configs/app_style.dart';
import 'package:blueboard/pages/first_setup/first_setup_page.dart';
import 'package:blueboard/pages/sign_in/sign_in_page.dart';
import 'package:blueboard/pages/sign_up/sign_up_page.dart';
import 'package:blueboard/pages/trips/trips_page.dart';
import 'package:blueboard/services/navigation.dart';
import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) => new MaterialApp(
        theme: AppStyle.themeDataLight,
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
            case TripsPage.tag:
              return MaterialPageRoute(builder: (context) => TripsPage());
              break;
						case FirstSetupPage.tag:
							return MaterialPageRoute(builder: (context) => FirstSetupPage());
							break;
            default:
              return MaterialPageRoute(builder: (context) => SignInPage());
              break;
          }
        },
        home: SignInPage(),
      );
}
