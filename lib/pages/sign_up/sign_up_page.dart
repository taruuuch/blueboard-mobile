import 'package:blueboard/pages/sign_up/sign_up_bloc.dart';
import 'package:blueboard/pages/sign_up/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
			body: BlocProvider.value(
				value: BlocProvider.of<SignUpBloc>(context),
				child: new SafeArea(
					child: SignUpForm(),
				),
			),
		);
}
