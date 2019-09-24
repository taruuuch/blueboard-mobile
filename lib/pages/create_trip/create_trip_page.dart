import 'package:blueboard/pages/create_trip/widgets/create_trip_form.dart';
import 'package:blueboard/widgets/drawer/drawer.dart';
import 'package:flutter/material.dart';

class CreateTripPage extends StatelessWidget {
  static const String tag = 'create-trips';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
				title: new Text('CREATE TRIP'),
				centerTitle: true,
				backgroundColor: Colors.white,
			),
      drawer: AppDrawer(),
      body: new CreateTripForm(),
    );
  }
}