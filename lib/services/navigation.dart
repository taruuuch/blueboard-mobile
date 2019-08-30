import 'package:flutter/material.dart';

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

  static Future<dynamic> navigateTo(String routeName) => navigatorKey.currentState.pushReplacementNamed(routeName);
}