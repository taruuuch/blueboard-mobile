import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
}

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName) => navigatorKey.currentState.pushReplacementNamed(routeName);
}