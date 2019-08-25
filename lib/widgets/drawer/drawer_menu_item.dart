import 'package:flutter/material.dart';

class DrawerMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final GestureTapCallback onTap;

  const DrawerMenuItem({this.icon, this.title, this.onTap});
  
  @override
  Widget build(BuildContext context) =>
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
}