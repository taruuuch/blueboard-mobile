import 'package:flutter/material.dart';

class TripItem extends StatefulWidget {
	@override
	State createState() => new _TripItemState();
}

class _TripItemState extends State<TripItem> {
	@override
	Widget build(BuildContext context) => new Scaffold(
		body: new Container(
			decoration: new BoxDecoration(
				image: DecorationImage(
					image: AssetImage(''),
					fit: BoxFit.fitWidth
				),
			),
			child: new Column(
				mainAxisAlignment: MainAxisAlignment.end,
				children: <Widget>[
					new Text('Title')
				],
			),
		),
	);
}