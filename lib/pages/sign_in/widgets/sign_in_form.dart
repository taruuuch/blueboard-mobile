// import 'package:blueboard/services/form_validators.dart';
import 'package:blueboard/pages/sign_in/widgets/sign_in_social.dart';
import 'package:blueboard/widgets/button.dart';
import 'package:blueboard/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'sign_in_bloc.dart';
import 'sign_in_event.dart';
import 'sign_in_state.dart';

class SignInForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _onSignInPressed(SignInBloc bloc, _formKey) {
    if (!_formKey.currentState.validate()) return;
    
    bloc.dispatch(SignIn(
      email: _emailController.text,
      password: _passwordController.text,
    ));
  }

  void _onSignUpPressed(SignInBloc bloc) {    
    bloc.dispatch(GoToSignUpPage());
  }

  @override
  Widget build(BuildContext context) {
    final SignInBloc bloc = BlocProvider.of<SignInBloc>(context);
    return new Form(
      key: _formKey,
      child: new Center(
        child: new SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new FlutterLogo(
                size: 100.0,
              ),
              new SizedBox(
                height: 15.0,
              ),
              new InputField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                // formValidator: FormValidators.emailValidate(),
                labelText: 'Enter email',
                obscureText: false,
                textInputAction: TextInputAction.next,
              ),
              new SizedBox(
                height: 15.0,
              ),
              new InputField(
                controller: _passwordController,
                keyboardType: TextInputType.text,
                // formValidator: FormValidators.passwordValidate(),
                labelText: 'Enter password',
                obscureText: true,
                textInputAction: TextInputAction.done,
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  new FlatButton(
                    child: new Text('Forgot password?'),
                    onPressed: () => {},
                  ),
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
                      style: TextStyle(color: Colors.red[900]),
                    );
                  else
                    return new SizedBox.shrink();
                },
              ),
              new SizedBox(
                height: 15.0,
              ),
              SignInSocial(),
              new SizedBox(
                height: 30.0,
              ),
              new RichText(
                textAlign: TextAlign.center,
                text: new TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                      text: 'By creating an account, you agree to our Terms of Service and Privacy Policy', 
                      style: TextStyle(
                        color: Colors.black26
                      ),
                    )
                  ],
                )
              ),
              new SizedBox(
                height: 30.0,
              ),
              new Row(
                children: <Widget>[
                  Expanded(
                    child: new StreamBuilder(
                      stream: bloc.state,
                      builder: (context, snapshot) {
                        return new FlatButton(
                          child: new Text('New user? Sign up here'),
                          textColor: Colors.blue,
                          onPressed: () => _onSignUpPressed(bloc),
                        );
                      },
                    )
                  ),
                  Expanded(
                    child: new StreamBuilder(
                      stream: bloc.state,
                      builder: (BuildContext context, AsyncSnapshot<SignInState> snapshot) {
                        return new Button(
                          child: new Text('SIGN IN'),
                          color: Colors.blue,
                          splashColor: Colors.blueAccent,
                          textColor: Colors.white,
                          onPressed: ( !snapshot.hasData || !snapshot.data.isLoading ) ? () => _onSignInPressed(bloc, _formKey) : null
                        );
                      }
                    )
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
