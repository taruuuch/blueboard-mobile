import 'package:blueboard/pages/first_setup/widgets/first_setup_form.dart';
import 'package:flutter/material.dart';

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
			body: new FirstSetupForm()
		);
}
