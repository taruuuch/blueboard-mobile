import 'package:blueboard/models/tripParticipant.dart';
import 'package:blueboard/pages/participants_invite/widgets/participants_invite_item.dart';
import 'package:flutter/material.dart';

class ParticipantsInviteList extends StatelessWidget {
  final List<TripParticipant> participants;

  ParticipantsInviteList(this.participants);

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: participants.length,
      itemBuilder: (BuildContext context, int index) => new ParticipantItem(
        participant: participants[index],
      ),
    );
  }
}
