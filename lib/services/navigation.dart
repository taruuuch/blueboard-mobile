import 'package:blueboard/pages/first_setup/first_setup_page.dart';
import 'package:blueboard/pages/sign_in/sign_in_page.dart';
import 'package:blueboard/pages/sign_up/sign_up_page.dart';
import 'package:blueboard/pages/trips/trips_page.dart';
import 'package:flutter/material.dart';

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

  static Future<dynamic> navigateTo(String routeName) => navigatorKey.currentState.pushReplacementNamed(routeName);

  static toSignUpPage() => navigateTo(SignUpPage.tag);
  static toSignInPage() => navigateTo(SignInPage.tag);
  static toTripsPage() => navigateTo(TripsPage.tag);
  static toFirstSetupPage() => navigateTo(FirstSetupPage.tag);
}