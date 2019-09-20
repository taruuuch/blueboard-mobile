import 'package:blueboard/pages/trip/widgets/trip_info.dart';
import 'package:blueboard/widgets/drawer/drawer.dart';
import 'package:flutter/material.dart';

class TripPage extends StatelessWidget {
  static const String tag = 'trip';
  
  final String tripId;

  TripPage({
    this.tripId
  }) : super();
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
			appBar: new AppBar(
				// title: new Text('TRIPS'),
				centerTitle: true,
				backgroundColor: Colors.white,
			),
			drawer: AppDrawer(),
			body: new TripInfo(tripId: tripId),
		);
  }
}