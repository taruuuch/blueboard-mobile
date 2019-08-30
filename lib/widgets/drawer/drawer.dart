import 'package:blueboard/pages/sign_in/sign_in_screen.dart';
import 'package:blueboard/pages/trips/trips_screen.dart';
import 'package:blueboard/services/navigation.dart';
import 'package:blueboard/widgets/drawer/drawer_menu_item.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
    new Drawer(
      child: new ListView(
        children: <Widget>[
          new DrawerHeader(
            child: new Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  new Text('Dmytro Artemchuk')
                ],
              )
            ),
            decoration: new BoxDecoration(
              color: Colors.grey,
            ),
          ),
          DrawerMenuItem(
            icon: Icons.create,
            title: 'Create Trip',
            onTap: () => NavigationService.navigateTo(TripPage.tag)
          ),
          new Divider(
            color: Colors.black38,
          ),
          DrawerMenuItem(
            icon: Icons.local_airport,
            title: 'Trips',
            onTap: () => NavigationService.navigateTo(TripPage.tag)
          ),
          new Divider(
            color: Colors.black38,
          ),
          DrawerMenuItem(
            icon: Icons.settings_applications,
            title: 'Settings',
            onTap: () => NavigationService.navigateTo(TripPage.tag)
          ),
          DrawerMenuItem(
            icon: Icons.exit_to_app,
            title: 'Sign Out',
            onTap: () => NavigationService.navigateTo(SignInPage.tag)
          ),
        ],
      ),
    );
}