import 'package:blueboard/services/form_validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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

  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

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
                validator: (value) => FormValidators.emailValidate(value)
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
                validator: (value) => FormValidators.phoneValidate(value)
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  new FlatButton(
                    child: new Text('Forgot password?'),
                    onPressed: null,
                  ),
                ],
              ),
              new SizedBox(
                height: 15.0,
              ),
              new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: new Divider(
                      color: Colors.blueGrey,
                      endIndent: 15.0,
                    ),
                  ),
                  new RichText(
                    textAlign: TextAlign.center,
                    text: new TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                          text: 'or social', 
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),
                        )
                      ],
                    )
                  ),
                  Expanded(
                    child: new Divider(
                      color: Colors.blueGrey,
                      indent: 15.0,
                    ),
                  ),
                ],
              ),
              new SizedBox(
                height: 15.0,
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new MaterialButton(
                    child: new Icon(FontAwesomeIcons.facebookF),
                    height: 42.0,
                    minWidth: 100.0,
                    color: Colors.blue,
                    splashColor: Colors.blueAccent,
                    textColor: Colors.white,
                    onPressed: () => {}
                  ),
                  new MaterialButton(
                    child: new Icon(FontAwesomeIcons.google),
                    height: 42.0,
                    minWidth: 100.0,
                    color: Colors.white,
                    splashColor: Colors.redAccent,
                    textColor: Colors.blue,
                    onPressed: () => {}
                  ),
                  new MaterialButton(
                    child: new Icon(FontAwesomeIcons.telegramPlane),
                    height: 42.0,
                    minWidth: 100.0,
                    color: Colors.lightBlue,
                    splashColor: Colors.blueAccent,
                    textColor: Colors.white,
                    onPressed: () => {}
                  ),
                ],
              ),
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
                        return new MaterialButton(
                            child: new Text('SIGN IN'),
                            height: 42.0,
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
        ),
      ),
    );
  }
}
