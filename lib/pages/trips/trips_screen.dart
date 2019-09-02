import 'package:blueboard/configs/app_style.dart';
import 'package:blueboard/widgets/drawer/drawer.dart';
import 'package:flutter/material.dart';

class TripPage extends StatelessWidget {
  static const String tag = 'trips';

  @override
  Widget build(BuildContext context) =>
    new Scaffold(
      appBar: new AppBar(
        title: new Text('TRIPS'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      drawer: AppDrawer(),
      body: new Padding(
        padding: const EdgeInsets.symmetric(vertical: AppStyle.formPadding, horizontal: AppStyle.formPadding),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Center(
              child: new Text('Welcome to Blue Board'),
            )
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: null,
        tooltip: 'Create trip',
        child: new Icon(Icons.add),
      ),
    );
}