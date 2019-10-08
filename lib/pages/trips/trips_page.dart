import 'package:blueboard/pages/trips/widgets/trips_list.dart';
import 'package:blueboard/pages/trips/widgets/trips_search.dart';
import 'package:blueboard/services/navigation.dart';
import 'package:blueboard/widgets/drawer/drawer.dart';
import 'package:flutter/material.dart';

class TripsPage extends StatelessWidget {
  static const String tag = 'trips';

  @override
  Widget build(BuildContext context) {
		return new Scaffold(
			appBar: new AppBar(
				title: new Text('TRIPS'),
				centerTitle: true,
				backgroundColor: Colors.white,
			),
			drawer: AppDrawer(),
			body: new Column(
        children: <Widget>[
          new TripSearchForm(),
          Expanded(
            child: new TripList()
          )
        ],
      ),
			floatingActionButton: new FloatingActionButton(
				tooltip: 'Create trip',
				child: new Icon(Icons.add),
				onPressed: () => NavigationService.toCreateTripPage(),
			),
		);
  }
}