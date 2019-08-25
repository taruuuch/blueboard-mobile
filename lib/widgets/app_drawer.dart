import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  Widget _createDrawerItem({IconData icon, String title, GestureTapCallback onTap}) =>
    new ListTile(
      title: new Row(
        children: <Widget>[
          new Icon(icon),
          new Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: new Text(title),
          )
        ],
      ),
      onTap: onTap,
    );

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
          _createDrawerItem(
            icon: Icons.create,
            title: 'Create Trip',
            onTap: () => Navigator.pushReplacementNamed(context, '/trip')
          ),
          new Divider(
            color: Colors.black38,
          ),
          _createDrawerItem(
            icon: Icons.local_airport,
            title: 'Trips',
            onTap: () => Navigator.pushReplacementNamed(context, '/trip')
          ),
          new Divider(
            color: Colors.black38,
          ),
          _createDrawerItem(
            icon: Icons.settings_applications,
            title: 'Settings',
            onTap: () => Navigator.pushReplacementNamed(context, '/trip')
          ),
          _createDrawerItem(
            icon: Icons.exit_to_app,
            title: 'Sign Out',
            onTap: () => Navigator.pushReplacementNamed(context, '/signin')
          ),
        ],
      ),
    );
}