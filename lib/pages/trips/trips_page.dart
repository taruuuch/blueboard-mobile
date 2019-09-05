import 'package:blueboard/configs/app_style.dart';
import 'package:blueboard/pages/trips/widgets/trip_item.dart';
import 'package:blueboard/widgets/drawer/drawer.dart';
import 'package:flutter/material.dart';

class TripsPage extends StatelessWidget {
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
            new TripItem()
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