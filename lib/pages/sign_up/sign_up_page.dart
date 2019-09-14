import 'package:blueboard/pages/sign_up/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  static const String tag = 'sign-up';
  @override
  Widget build(BuildContext context) => 
		new Scaffold(
			appBar: new AppBar(
				title: new Text('Sign Up'),
				centerTitle: true,
				backgroundColor: Colors.white,
			),
			body: new SafeArea(
        child: SignUpForm(),
      ),
		);
}
