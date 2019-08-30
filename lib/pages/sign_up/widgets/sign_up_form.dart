import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'sign_up_bloc.dart';
import 'sign_up_event.dart';
import 'sign_up_state.dart';

class SignUpForm extends StatefulWidget {
  @override
  State createState() => new _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordRepeatController = TextEditingController();

  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _passwordRepeatFocus = FocusNode();

  bool checkedValue = false;

  @override
  Widget build(BuildContext context) {
    final SignUpBloc bloc = BlocProvider.of<SignUpBloc>(context);

    return new Form(
      key: _formKey,
      child: new SingleChildScrollView(
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
              textInputAction: TextInputAction.next,
              focusNode: _emailFocus,
              onFieldSubmitted: (term) {
                _emailFocus.unfocus();
                FocusScope.of(context).requestFocus(_passwordFocus);
              },
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
              textInputAction: TextInputAction.next,
              focusNode: _passwordFocus,
              onFieldSubmitted: (term) {
                _passwordFocus.unfocus();
                FocusScope.of(context).requestFocus(_passwordRepeatFocus);
              },
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
              textInputAction: TextInputAction.done,
              focusNode: _passwordRepeatFocus,
              onFieldSubmitted: (term) {
                _passwordRepeatFocus.unfocus();
              },
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
                  child: new StreamBuilder(
                    stream: bloc.state,
                    builder: (context, snapshot) {
                        return new FlatButton(
                        textColor: Colors.black54,
                        child: new Text('Cancel'),
                        onPressed: () => _onCancelPressed(bloc),
                      );
                    },
                  )
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

  void _onCancelPressed(SignUpBloc bloc) {
    bloc.dispatch(Cancel());
  }
}