import 'package:blueboard/pages/trips/widgets/trips_item.dart';
import 'package:flutter/material.dart';

class TripList extends StatelessWidget {
	@override
	Widget build(BuildContext context) => 
		new ListView(
			children: <Widget>[
				new TripItem(
					decorationImage: AssetImage('assets/testimage.jpg'),
					title: 'Austria trip 2019',
					create: 'by Artemchuk Dmytro'
				),
				new TripItem(
					decorationImage: AssetImage('assets/testimage.jpg'),
					title: 'Austria trip 2019',
					create: 'by Artemchuk Dmytro'
				),
				new TripItem(
					decorationImage: AssetImage('assets/testimage.jpg'),
					title: 'Austria trip 2019',
					create: 'by Artemchuk Dmytro'
				),
				new TripItem(
					decorationImage: AssetImage('assets/testimage.jpg'),
					title: 'Austria trip 2019',
					create: 'by Artemchuk Dmytro'
				),
				new TripItem(
					decorationImage: AssetImage('assets/testimage.jpg'),
					title: 'Austria trip 2019',
					create: 'by Artemchuk Dmytro'
				),
				new TripItem(
					decorationImage: AssetImage('assets/testimage.jpg'),
					title: 'Austria trip 2019',
					create: 'by Artemchuk Dmytro'
				),
				new TripItem(
					decorationImage: AssetImage('assets/testimage.jpg'),
					title: 'Austria trip 2019',
					create: 'by Artemchuk Dmytro'
				),
				new TripItem(
					decorationImage: AssetImage('assets/testimage.jpg'),
					title: 'Austria trip 2019',
					create: 'by Artemchuk Dmytro'
				),
				new TripItem(
					decorationImage: AssetImage('assets/testimage.jpg'),
					title: 'Austria trip 2019',
					create: 'by Artemchuk Dmytro'
				),
			],
		);
}