import 'package:blueboard/screens/sign_in/widgets/signin_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'signin_event.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final SignInBloc bloc = BlocProvider.of<SignInBloc>(context);
    return new Form(
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
                  borderSide: new BorderSide(color: Colors.grey)
                ),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            new SizedBox(
              height: 15.0,
            ),
            new TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Enter password',
                border: new OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.grey)
                ),
              ),
              obscureText: true,
              keyboardType: TextInputType.text,
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
                  child: new MaterialButton(
                    child: new Text('SIGN IN'),
                    height: 42.0,
                    minWidth: 150.0,
                    color: Colors.blue,
                    splashColor: Colors.blueAccent,
                    textColor: Colors.white,
                    onPressed: () {
                      bloc.dispatch(SignIn(
                        email: _emailController.text,
                        password: _passwordController.text,
                      ));
                    },
                  ),
                )
              ],
            ),
            new StreamBuilder(
              stream: bloc.statusState,
              builder: (context, snapshot) {
                if (snapshot.hasData)
                  return new Text('Auth failed {$snapshot}');
                else
                  return new SizedBox.shrink();
              },
            ),
          ],
        ),
      )
    );
  }
}