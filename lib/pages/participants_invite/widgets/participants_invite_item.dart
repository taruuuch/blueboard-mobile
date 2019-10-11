import 'package:blueboard/configs/app_style.dart';
import 'package:blueboard/models/tripParticipant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ParticipantItem extends StatelessWidget {
  final TripParticipant participant;

  const ParticipantItem({Key key, this.participant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new GestureDetector(
        child: new Row(
          children: <Widget>[
            new Image.asset(
              'assets/ava_green.png',
              height: 50,
              fit: BoxFit.fill,
            ),
            new Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: AppStyle.primaryPadding),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(
                      participant.firstName + ' ' + participant.lastName,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    new Text(
                      participant.username,
                      style: TextStyle(
                        color: Colors.grey
                      ),
                    )
                  ],
                ),
              ),
            ),
            new GestureDetector(
              child: new Icon(
                FontAwesomeIcons.times,
                size: 16.0
              ),
            ),
            new GestureDetector(
              child: new Icon(
                FontAwesomeIcons.paperPlane,
                size: 16.0
              ),
            )
          ],
        ),
      )
    );
  }
}
