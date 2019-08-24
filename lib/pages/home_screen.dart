import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  void createTripPressed() {

  }

  @override
  Widget build(BuildContext context) =>
    new Scaffold(
      appBar: new AppBar(
        title: new Text('SIGN UP'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Center(
            child: new Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
              child: new Text('Welcome to Blue Board'),
            ),
          )
        ],
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: createTripPressed,
        tooltip: 'Create trip',
        child: new Icon(Icons.add),
      ),
    );
}