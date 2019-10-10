import 'package:blueboard/pages/create_trip/create_trip_page.dart';
import 'package:blueboard/pages/first_setup/first_setup_page.dart';
import 'package:blueboard/pages/participants_invite/participants_invite_page.dart';
import 'package:blueboard/pages/sign_in/sign_in_page.dart';
import 'package:blueboard/pages/sign_up/sign_up_page.dart';
import 'package:blueboard/pages/trips/trips_page.dart';
import 'package:flutter/material.dart';

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

  static Future<dynamic> navigateTo(String routeName, {dynamic arguments}) => navigatorKey.currentState.pushReplacementNamed(routeName, arguments: arguments);

  static toSignUpPage() => navigateTo(SignUpPage.tag);
  static toSignInPage() => navigateTo(SignInPage.tag);
  static toTripsPage() => navigateTo(TripsPage.tag);
  static toFirstSetupPage() => navigateTo(FirstSetupPage.tag);
  static toCreateTripPage() => navigateTo(CreateTripPage.tag);
  static toParticipantsInvite() => navigateTo(ParticipantsInvitePage.tag);
}
