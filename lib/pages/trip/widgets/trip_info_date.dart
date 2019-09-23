import 'package:flutter/material.dart';

class TripInfoDate extends StatelessWidget {
  final String fromDate;
  final String toDate;

  TripInfoDate({
    this.fromDate,
    this.toDate
  });

  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        new Column(
          children: <Widget>[
            new Text(
              'From', 
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w700
              ),
            ),
            new Text(
              fromDate, 
              textAlign: TextAlign.center,
              style: TextStyle(
                fontStyle: FontStyle.italic
              ),
            ),
          ],
        ),
        new Column(
          children: <Widget>[
            new Text(
              'To', 
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w700
              ),
            ),
            new Text(
              toDate, 
              textAlign: TextAlign.center,
              style: TextStyle(
                fontStyle: FontStyle.italic
              ),
            ),
          ],
        ),
      ],
    );
  }
}