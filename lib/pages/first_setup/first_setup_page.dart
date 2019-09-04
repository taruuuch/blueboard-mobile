import 'package:blueboard/pages/first_setup/widgets/first_setup_bloc.dart';
import 'package:blueboard/pages/first_setup/widgets/first_setup_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirstSetupPage extends StatelessWidget {
  static const String tag = 'first-setup';

  @override
  Widget build(BuildContext context) => 
		new Scaffold(
			appBar: new AppBar(
				title: new Text('Setup profile'),
				centerTitle: true,
				backgroundColor: Colors.white,
			),
			body: BlocProvider<FirstSetupBloc>(
				builder: (context) => FirstSetupBloc(),
				child: FirstSetupForm(),
			),
		);
}
