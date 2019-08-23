import 'package:blueboard/pages/home_screen.dart';
import 'package:blueboard/pages/signin_screen.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  State createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  bool checkedValue = false;
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
            new Padding(
              padding: new EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
              child: new TextFormField(
                decoration: InputDecoration(
                  labelText: 'Enter email'
                ),
                keyboardType: TextInputType.emailAddress,
              ),
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
              padding: new EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
              child: new TextFormField(
                decoration: InputDecoration(
                  labelText: 'Repeat password'
                ),
                obscureText: true,
                keyboardType: TextInputType.text,
              ),
            ),
            new Row(
              children: <Widget>[
                Expanded(
                  child: new Padding(
                    padding: new EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                    child: new Checkbox(
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
                  child: new Text('Agreement!'),
                )
              ],
            ),
            new Padding(
              padding: new EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
              child: new Row(
                children: <Widget>[
                  Expanded(
                    child: new FlatButton(
                      textColor: Colors.black54,
                      child: Text('Cancel'),
                      onPressed: () {
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context) => SignInScreen(),
                          )
                        );
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
                      child: Text('Sign In'),
                      onPressed: () {
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          )
                        );
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