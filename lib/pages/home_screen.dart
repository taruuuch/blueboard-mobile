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
      body: new Center(
        
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: createtrippressed,
        tooltip: 'Create trip',
        child: new Icon(Icons.add),
      ),
    );
  }
}