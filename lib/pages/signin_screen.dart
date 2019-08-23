import 'package:blueboard/pages/home_screen.dart';
import 'package:blueboard/pages/signup_screen.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  @override
  State createState() => new SignInScreenState();
}

class SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Sign In'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Padding(
            padding: new EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
            child: new TextFormField(
              decoration: InputDecoration(
                labelText: 'Enter email'
              ),
              keyboardType: TextInputType.emailAddress,
            )
          ),
          new Padding(
            padding: new EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
            child: new TextFormField(
              decoration: InputDecoration(
                labelText: 'Enter password'
              ),
              obscureText: true,
              keyboardType: TextInputType.text,
            ),
          ),
          new Padding(
            padding: new EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
            child: new Row(
              children: <Widget>[
                Expanded(
                  child: new FlatButton(
                    child: Text('Sign Up'),
                    textColor: Colors.blue,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
                    },
                  ),
                ),
                Expanded(
                  child: new MaterialButton(
                    child: Text('Sign In'),
                    height: 42.0,
                    minWidth: 150.0,
                    color: Colors.blue,
                    splashColor: Colors.blueAccent,
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                    },
                  ),
                )
              ],
            )
          )
        ],
      )
    );
  }
}