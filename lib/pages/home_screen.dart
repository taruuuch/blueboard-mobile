import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State createState() => new HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  void createTripPressed() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SIGN UP'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
              child: Text('Welcome to Blue Board'),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createTripPressed,
        tooltip: 'Create trip',
        child: Icon(Icons.add),
      ),
    );
  }
}