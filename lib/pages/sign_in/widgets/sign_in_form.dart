import 'package:blueboard/configs/app_constans.dart';
import 'package:blueboard/configs/app_style.dart';
import 'package:blueboard/pages/sign_in/widgets/sign_in_social.dart';
import 'package:blueboard/services/form_validators.dart';
import 'package:blueboard/widgets/button.dart';
import 'package:blueboard/widgets/input_field.dart';
import 'package:blueboard/pages/sign_in/sign_in_bloc.dart';
import 'package:blueboard/pages/sign_in/sign_in_event.dart';
import 'package:blueboard/pages/sign_in/sign_in_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInForm extends StatefulWidget {
  @override
  State createState() => new _SignInFormState();
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

  void _onSignUpPressed(SignInBloc bloc) => bloc.dispatch(GoToSignUpPage());

  @override
  Widget build(BuildContext context) {
    final SignInBloc _bloc = Provider.of<SignInBloc>(context);
    return new Form(
      key: _formKey,
      child: new Center(
        child: new SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: AppStyle.formPadding),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new FlutterLogo(
                size: 100.0,
              ),
              new SizedBox(height: AppStyle.primaryPadding),
              new InputField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                formValidator: (value) => FormValidators.emailValidate(value),
                labelText: AppConstants.emailInputLabel,
              ),
              new SizedBox(height: AppStyle.primaryPadding),
              new InputField(
                controller: _passwordController,
                keyboardType: TextInputType.text,
                formValidator: (value) => FormValidators.passwordValidate(value),
                labelText: AppConstants.passwordInputLabel,
                obscureText: true,
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
              new SizedBox(height: AppStyle.primaryPadding),
              new StreamBuilder(
                stream: _bloc.state,
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
              new SizedBox(height: AppStyle.primaryPadding),
              SignInSocial(),
              new SizedBox(height: 30.0),
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
              new SizedBox(height: 30.0),
              new Row(
                children: <Widget>[
                  Expanded(
                    child: new StreamBuilder(
                      stream: _bloc.state,
                      builder: (context, snapshot) {
                        return new FlatButton(
                          child: new Text('New user? Sign up here'),
                          textColor: Colors.blue,
                          onPressed: () => _onSignUpPressed(_bloc),
                        );
                      },
                    )
                  ),
                  Expanded(
                    child: new StreamBuilder(
                      stream: _bloc.state,
                      builder: (BuildContext context, AsyncSnapshot<SignInState> snapshot) {
                        return new Button(
                          child: new Text('SIGN IN'),
                          color: Colors.blue,
                          splashColor: Colors.blueAccent,
                          textColor: Colors.white,
                          onPressed: ( !snapshot.hasData || !snapshot.data.isLoading ) ? () => _onSignInPressed(_bloc, _formKey) : null
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
