import 'package:blueboard/configs/app_constans.dart';
import 'package:blueboard/pages/sign_in/widgets/sign_in_form.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  static const String tag = 'sign-in';
  
  @override
  Widget build(BuildContext context) => 
    new Scaffold(
      appBar: new AppBar(
        title: new Text(AppConstants.signInTitle),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
			body: new SignInForm()
    );
}
