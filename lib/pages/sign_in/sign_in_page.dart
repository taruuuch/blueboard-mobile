import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/sign_in_form.dart';
import 'widgets/sign_in_bloc.dart';

class SignInPage extends StatelessWidget {
  static const String tag = 'sign-in';
  
  @override
  Widget build(BuildContext context) => 
    new Scaffold(
      appBar: new AppBar(
        title: new Text('Sign In'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: BlocProvider<SignInBloc> (
        builder: (context) => SignInBloc(),
        child: SignInForm(),
      ),
    );
}
