import 'package:blueboard/services/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'sign_in_bloc.dart';
import 'sign_in_event.dart';
import 'sign_in_state.dart';

class SignInForm extends StatefulWidget {
  @override
  State createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    final SignInBloc bloc = BlocProvider.of<SignInBloc>(context);
    return new Form(
      key: _formKey,
      child: new Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
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
                return 'Enter email';
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
            textInputAction: TextInputAction.done,
            focusNode: _passwordFocus,
            onFieldSubmitted: (term) {
              _passwordFocus.unfocus();
            },
            validator: (value) {
              if (value.isEmpty) {
                return 'Enter password';
              } else if (value.length < 6) {
                return 'Minimum password length 6';
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
                child: new FlatButton(
                  child: new Text('SIGN UP'),
                  textColor: Colors.blue,
                  onPressed: () {
                    locator<NavigationService>().navigateTo('sign-up');
                  },
                ),
              ),
              Expanded(
                  child: new StreamBuilder(
                      stream: bloc.state,
                      builder: (BuildContext context, AsyncSnapshot<SignInState> snapshot) {
                        return new MaterialButton(
                            child: new Text('SIGN IN'),
                            height: 42.0,
                            minWidth: 150.0,
                            color: Colors.blue,
                            splashColor: Colors.blueAccent,
                            textColor: Colors.white,
                            onPressed: ( !snapshot.hasData || !snapshot.data.isLoading ) ? () => _onSignInPressed(bloc, _formKey) : null
                        );
                      }))
            ],
          ),
          new SizedBox(
            height: 15.0,
          ),
          new StreamBuilder(
            stream: bloc.state,
            builder: (context, AsyncSnapshot<SignInState> snapshot) {
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
    ));
  }

  void _onSignInPressed(SignInBloc bloc, _formKey) {
    if (!_formKey.currentState.validate()) return;
    
    bloc.dispatch(SignIn(
      email: _emailController.text,
      password: _passwordController.text,
    ));
  }
}
