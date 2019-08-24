import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  State createState() => new SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  bool checkedValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
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
            ),
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
            padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Repeat password'
              ),
              obscureText: true,
              keyboardType: TextInputType.text,
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                  child: Checkbox(
                    value: checkedValue,
                    onChanged: (newValue) {
                      setState(() {
                        checkedValue = !checkedValue;
                      });
                    },
                  ),
                )
              ),
              Expanded(
                child: Text('Agreement!'),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: FlatButton(
                    textColor: Colors.black54,
                    child: Text('Cancel'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/signin');
                    },
                  ),
                ),
                Expanded(
                  child: MaterialButton(
                    height: 42.0,
                    minWidth: 150.0,
                    color: Colors.blue,
                    splashColor: Colors.blueAccent,
                    textColor: Colors.white,
                    child: Text('SIGN IN'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}