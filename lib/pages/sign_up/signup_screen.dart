import 'package:blueboard/pages/sign_up/widgets/signup_bloc.dart';
import 'package:blueboard/pages/sign_up/widgets/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatefulWidget {
  @override
  State createState() => new SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) => 
    new Scaffold(
      appBar: new AppBar(
        title: new Text('Sign Up'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: BlocProvider<SignUpBloc> (
        builder: (context) => SignUpBloc(),
        child: SignUpForm(),
      ),
    );
}
