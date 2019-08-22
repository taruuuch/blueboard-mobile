import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  @override
  State createState() => new SignInScreenState();
}

class SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new TextFormField(
              decoration: new InputDecoration(
                labelText: 'Enter email'
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            new TextFormField(
              decoration: new InputDecoration(
                labelText: 'Enter password'
              ),
              obscureText: true,
              keyboardType: TextInputType.text,
            ),
            new MaterialButton(
              height: 42.0,
              minWidth: 150.0,
              color: Colors.blue,
              splashColor: Colors.blueAccent,
              textColor: Colors.white,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}