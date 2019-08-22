import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  @override
  State createState() => new SignInScreenState();
}

class SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Enter email'
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Enter password'
            ),
            obscureText: true,
            keyboardType: TextInputType.text,
          ),
          MaterialButton(
            height: 42.0,
            minWidth: 150.0,
            color: Colors.blue,
            splashColor: Colors.blueAccent,
            textColor: Colors.white,
            onPressed: () {},
          )
        ],
      ),
    );
  }
}