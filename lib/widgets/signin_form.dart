import 'package:flutter/material.dart';

class SignInForm extends StatefulWidget {
  @override
  SignInFormState createState() => SignInFormState();
}

class SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) =>
    new Form(
      key: _formKey,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
              child: new TextFormField(
                decoration: InputDecoration(labelText: 'Enter email'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              )),
          new Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
            child: new TextFormField(
              decoration: InputDecoration(labelText: 'Enter password'),
              obscureText: true,
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
          ),
          new Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
            child: new Row(
              children: <Widget>[
                Expanded(
                  child: new FlatButton(
                    child: Text('SIGN UP'),
                    textColor: Colors.blue,
                    onPressed: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                  ),
                ),
                Expanded(
                  child: new MaterialButton(
                    child: Text('SIGN IN'),
                    height: 42.0,
                    minWidth: 150.0,
                    color: Colors.blue,
                    splashColor: Colors.blueAccent,
                    textColor: Colors.white,
                    onPressed: () {
                      if (_formKey.currentState.validate())
                        Navigator.pushNamed(context, '/home');
                    },
                  ),
                )
              ],
            )
          )
        ],
      ),
    );
}