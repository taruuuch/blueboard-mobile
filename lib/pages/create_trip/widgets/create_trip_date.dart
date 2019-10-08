import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreateTripDate extends StatelessWidget {
  final String title;
  final DateTime date;

  CreateTripDate({this.title, this.date}) : super();

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Text(title, style: TextStyle(fontWeight: FontWeight.w700)),
        (date != null)
            ? new Text(DateFormat('dd.MM.yyyy').format(date))
            : new SizedBox.shrink(),
      ],
    );
  }
}
