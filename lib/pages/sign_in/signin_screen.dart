import 'package:blueboard/pages/sign_in/widgets/signin_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/signin_bloc.dart';

class SignInPage extends StatelessWidget {
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
