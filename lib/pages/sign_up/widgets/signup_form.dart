import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'signup_bloc.dart';
import 'signup_event.dart';
import 'signup_state.dart';

class SignUpForm extends StatefulWidget {
  @override
  State createState() => new _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordRepeatController = TextEditingController();

  bool checkedValue = false;

  @override
  Widget build(BuildContext context) {
    final SignUpBloc bloc = BlocProvider.of<SignUpBloc>(context);

    return new Form(
      key: _formKey,
      child: new Padding(
        padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new SizedBox(
              height: 15.0
            ),
            new TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Enter email',
                border: new OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.grey)),
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter your email';
                } else if (!RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
                  return 'Invalid email';
                }
                return null;
              },
            ),
            new SizedBox(
              height: 15.0,
            ),
            new TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Enter password',
                border: new OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.grey)),
              ),
              obscureText: true,
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter password';
                } else if (value.length < 6) {
                  return 'Minimum password length 6';
                }
                return null;
              },
            ),
            new SizedBox(
              height: 15.0,
            ),
            new TextFormField(
              controller: _passwordRepeatController,
              decoration: InputDecoration(
                labelText: 'Repeat password',
                border: new OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.grey)),
              ),
              obscureText: true,
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please repeat your password';
                } else if (value != _passwordController.text) {
                  return 'Your password not matched';
                }
                return null;
              },
            ),
            new SizedBox(
              height: 15.0,
            ),
            new Row(
              children: <Widget>[
                Expanded(
                  child: new Checkbox(
                    value: checkedValue,
                    onChanged: (newValue) {
                      setState(() {
                        checkedValue = !checkedValue;
                      });
                    },
                  )
                ),
                Expanded(
                  child: new Text('Agreement!'),
                )
              ],
            ),
            new SizedBox(
              height: 15.0,
            ),
            new Row(
              children: <Widget>[
                Expanded(
                  child: new FlatButton(
                    textColor: Colors.black54,
                    child: new Text('Cancel'),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/signin');
                    },
                  ),
                ),
                Expanded(
                  child: new StreamBuilder(
                    stream: bloc.state,
                    builder: (BuildContext context, AsyncSnapshot<SignUpState> snapshot) {
                      return new MaterialButton(
                        child: new Text('SIGN IN'),
                        height: 42.0,
                        minWidth: 150.0,
                        color: Colors.blue,
                        splashColor: Colors.blueAccent,
                        textColor: Colors.white,
                        onPressed: (!snapshot.hasData || !snapshot.data.isLoading) ? () => _onSignUpPressed(bloc, _formKey) : null,
                      );
                    }
                  )
                )
              ],
            ),
            new SizedBox(
              height: 15.0,
            ),
            new StreamBuilder(
              stream: bloc.state,
              builder: (context, AsyncSnapshot<SignUpState> snapshot) {
                if (snapshot.hasData && snapshot.data.error != '')
                  return new Text(
                    snapshot.data.error,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  );
                else
                  return new SizedBox.shrink();
              },
            ),
          ],
        ),
      )
    );
  }

  void _onSignUpPressed(SignUpBloc bloc, _formKey) {
    if (!_formKey.currentState.validate() || !checkedValue) return;

    bloc.dispatch(SignUp(
      email: _emailController.text,
      password: _passwordController.text,
    ));
  }
}