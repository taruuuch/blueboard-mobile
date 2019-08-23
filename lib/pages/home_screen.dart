import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State createState() => new HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  void createtrippressed() {

  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Sign Up'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Center(
            child: new Text('Welcome to Blue Board'),
          )
        ],
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: createtrippressed,
        tooltip: 'Create trip',
        child: new Icon(Icons.add),
      ),
    );
  }
}