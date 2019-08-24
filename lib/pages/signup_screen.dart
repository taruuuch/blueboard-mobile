import 'package:blueboard/widgets/signup_form.dart';
import 'package:flutter/material.dart';

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
      body: SignUpForm()
    );
}
