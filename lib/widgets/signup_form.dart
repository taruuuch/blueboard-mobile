import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  @override
  State createState() => new SignUpFormState();
}

class SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

  bool checkedValue = false;

  @override
  Widget build(BuildContext context) =>
    new Form(
      key: _formKey,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
            child: new TextFormField(
              decoration: InputDecoration(labelText: 'Enter email'),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
          ),
          new Padding(
            padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
            child: new TextFormField(
              decoration: InputDecoration(labelText: 'Enter password'),
              obscureText: true,
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter password';
                }
                return null;
              },
            ),
          ),
          new Padding(
            padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
            child: new TextFormField(
              decoration: InputDecoration(labelText: 'Repeat password'),
              obscureText: true,
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please repeat your password';
                }
                return null;
              },
            ),
          ),
          new Row(
            children: <Widget>[
              Expanded(
                child: new Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
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
                    child: new Text('Cancel'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/signin');
                    },
                  ),
                ),
                Expanded(
                  child: new MaterialButton(
                    height: 42.0,
                    minWidth: 150.0,
                    color: Colors.blue,
                    splashColor: Colors.blueAccent,
                    textColor: Colors.white,
                    child: new Text('SIGN IN'),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        Navigator.pushNamed(context, '/home');
                      }
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