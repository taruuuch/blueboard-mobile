import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  State createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  bool checkedValue = false;
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
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Repeat password'
              ),
              obscureText: true,
              keyboardType: TextInputType.text,
            ),
            CheckboxListTile(
              title: Text('Agreement!'),
              value: checkedValue,
              onChanged: (newvalue) {},
              controlAffinity: ListTileControlAffinity.leading
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: MaterialButton(
                    height: 42.0,
                    minWidth: 150.0,
                    color: Colors.blue,
                    splashColor: Colors.blueAccent,
                    textColor: Colors.black,
                    child: Text('Sign Up'),
                    onPressed: () {},
                  ),
                ),
                Expanded(
                  child: MaterialButton(
                    height: 42.0,
                    minWidth: 150.0,
                    color: Colors.blue,
                    splashColor: Colors.blueAccent,
                    textColor: Colors.white,
                    child: Text('Sign In'),
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ],
      ),
    );
  }
}