import 'package:blueboard/screens/sign_in/widgets/signin_form.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  @override
  State createState() => new SignInPageState();
}

class SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) => 
    new Scaffold(
      appBar: new AppBar(
        title: new Text('Sign In'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SignInForm()
    );
}
