import 'package:blueboard/screens/sign_in/widgets/signin_bloc.dart';
import 'package:blueboard/screens/sign_in/widgets/signin_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'signin_event.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                    Navigator.pushReplacementNamed(context, '/signup');
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
                            onPressed: ( !snapshot.hasData || !snapshot.data.isLoading ) ? () => onClick(bloc, _formKey) : null
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

    void onClick(SignInBloc bloc, _formKey) {
      if (!_formKey.currentState.validate()) return;
      
      bloc.dispatch(SignIn(
        email: _emailController.text,
        password: _passwordController.text,
      ));
    }
}
