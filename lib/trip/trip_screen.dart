import 'package:blueboard/widgets/app_drawer.dart';
import 'package:flutter/material.dart';

class TripPage extends StatefulWidget {
  @override
  State createState() => new TripPageState();
}

class TripPageState extends State<TripPage> {
  void createTripPressed() {

  }

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
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
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
        onPressed: createTripPressed,
        tooltip: 'Create trip',
        child: new Icon(Icons.add),
      ),
    );
}