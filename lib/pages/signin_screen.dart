import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  @override
  State createState() => new SignInScreenState();
}

class SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Enter email'
              ),
              keyboardType: TextInputType.emailAddress,
            )
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Enter password'
              ),
              obscureText: true,
              keyboardType: TextInputType.text,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: FlatButton(
                    child:Text('SIGN UP'),
                    textColor: Colors.blue,
                    onPressed: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                  ),
                ),
                Expanded(
                  child: MaterialButton(
                    child: Text('SIGN IN'),
                    height: 42.0,
                    minWidth: 150.0,
                    color: Colors.blue,
                    splashColor: Colors.blueAccent,
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
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