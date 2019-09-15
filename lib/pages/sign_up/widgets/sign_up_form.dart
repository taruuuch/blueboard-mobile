import 'package:blueboard/pages/sign_up/sign_up_bloc.dart';
import 'package:blueboard/pages/sign_up/sign_up_event.dart';
import 'package:blueboard/pages/sign_up/sign_up_state.dart';
import 'package:blueboard/configs/app_constans.dart';
import 'package:blueboard/configs/app_style.dart';
import 'package:blueboard/services/form_validators.dart';
import 'package:blueboard/widgets/button.dart';
import 'package:blueboard/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  void _onSignUpPressed(SignUpBloc _bloc, _formKey) {
    if (!_formKey.currentState.validate() || !checkedValue) return;

    _bloc.dispatch(SignUp(
      email: _emailController.text,
      password: _passwordController.text,
    ));
  }

  void _onCancelPressed(SignUpBloc _bloc) {
    _bloc.dispatch(Cancel());
  }

  @override
  Widget build(BuildContext context) {
    final SignUpBloc _bloc = Provider.of<SignUpBloc>(context);

    return new Form(
        key: _formKey,
        child: new Padding(
          padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: AppStyle.formPadding),
          child: Center(
            child: SingleChildScrollView(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new FlutterLogo(size: 100),
                  new SizedBox(height: AppStyle.primaryPadding),
                  new InputField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    labelText: AppConstants.emailInputLabel,
                    formValidator: (value) => FormValidators.emailValidate(value),
                    textInputAction: TextInputAction.next,
                    fieldSubmitted: (value) {
                      FocusScope.of(context).nextFocus();
                    },
                  ),
                  new SizedBox(height: AppStyle.primaryPadding),
                  new InputField(
                    controller: _passwordController,
                    keyboardType: TextInputType.text,
                    labelText: AppConstants.passwordInputLabel,
                    formValidator: (value) => FormValidators.passwordValidate(value),
                    obscureText: true,
                    textInputAction: TextInputAction.next,
                    fieldSubmitted: (value) {
                      FocusScope.of(context).nextFocus();
                    },
                  ),
                  new SizedBox(height: AppStyle.primaryPadding),
                  new InputField(
                    controller: _passwordRepeatController,
                    keyboardType: TextInputType.text,
                    labelText: AppConstants.passwordRepeatInputLabel,
                    formValidator: (value) => FormValidators.passwordRepeatValidate(value, _passwordController.text),
                    obscureText: true,
                    textInputAction: TextInputAction.done,
                    fieldSubmitted: (value) {
                      FocusScope.of(context).nextFocus();
                    },
                  ),
                  new SizedBox(height: 5.0),
                  new Row(
                    children: <Widget>[
                      new Checkbox(
                        value: checkedValue,
                        onChanged: (newValue) {
                          setState(() {
                            checkedValue = !checkedValue;
                          });
                        },
                      ),
                      new FlatButton(
                        textColor: Colors.black54,
                        child: new Text('Accept agreement'),
                        onPressed: () => setState(() { checkedValue = !checkedValue; }),
                      ),
                    ],
                  ),
                  new SizedBox(height: 5.0),
                  new Row(
                    children: <Widget>[
                      Expanded(
                          child: new StreamBuilder(
                        stream: _bloc.state,
                        builder: (context, snapshot) {
                          return new FlatButton(
                            textColor: Colors.blue,
                            child: new Text('Cancel'),
                            onPressed: () => _onCancelPressed(_bloc),
                          );
                        },
                      )),
                      Expanded(
                        child: new StreamBuilder(
                          stream: _bloc.state,
                          builder: (BuildContext context, AsyncSnapshot<SignUpState> snapshot) {
                            return new Button(
                              child: new Text(AppConstants.signUpButtonLabel),
                              color: Colors.blue,
                              splashColor: Colors.blueAccent,
                              textColor: Colors.white,
                              onPressed: (!snapshot.hasData || !snapshot.data.isLoading) 
                                ? () => _onSignUpPressed(_bloc, _formKey) 
                                : null,
                            );
                          }
                        )
                      )
                    ],
                  ),
                  new SizedBox(height: AppStyle.primaryPadding),
                  new StreamBuilder(
                    stream: _bloc.state,
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
            ),
          ),
        ));
  }
}
