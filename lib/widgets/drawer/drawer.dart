import 'package:blueboard/services/navigation.dart';
import 'package:blueboard/widgets/drawer/drawer_menu_item.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) => new Drawer(
        child: new ListView(
          children: <Widget>[
            new DrawerHeader(
              child: new Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[new Text('Dmytro Artemchuk')],
                  )),
              decoration: new BoxDecoration(
                color: Colors.grey,
              ),
            ),
            DrawerMenuItem(
                icon: Icons.create,
                title: 'Create Trip',
                onTap: () => NavigationService.toTripsPage()),
            new Divider(
              color: Colors.black38,
            ),
            DrawerMenuItem(
                icon: Icons.local_airport,
                title: 'Trips',
                onTap: () => NavigationService.toTripsPage()),
            new Divider(
              color: Colors.black38,
            ),
            DrawerMenuItem(
                icon: Icons.settings_applications,
                title: 'Settings',
                onTap: () => NavigationService.toTripsPage()),
            DrawerMenuItem(
                icon: Icons.exit_to_app,
                title: 'Sign Out',
                onTap: () => NavigationService.toSignInPage()),
          ],
        ),
      );
}
