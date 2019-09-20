import 'package:blueboard/pages/trip/widgets/trip_info.dart';
import 'package:blueboard/widgets/drawer/drawer.dart';
import 'package:flutter/material.dart';

class TripPage extends StatelessWidget {
  static const String tag = 'trip';
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
			appBar: new AppBar(
				// title: new Text('TRIPS'),
				centerTitle: true,
				backgroundColor: Colors.white,
			),
			drawer: AppDrawer(),
			body: new TripInfo(),
			floatingActionButton: new FloatingActionButton(
				tooltip: 'Edit trip',
				child: new Icon(Icons.edit),
				onPressed: () => null,
			),
		);
  }
}