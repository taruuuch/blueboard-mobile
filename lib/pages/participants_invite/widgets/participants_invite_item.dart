import 'package:blueboard/models/tripParticipant.dart';
import 'package:flutter/material.dart';

class ParticipantItem extends StatelessWidget {
  final TripParticipant participant;

  const ParticipantItem({Key key, this.participant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Column(
        children: <Widget>[
          new Text(participant.firstName + ' ' + participant.lastName),
        ],
      ),
    );
  }
}
