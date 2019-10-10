import 'package:blueboard/models/tripParticipant.dart';
import 'package:blueboard/pages/participants_invite/participants_invite_bloc.dart';
import 'package:blueboard/pages/participants_invite/widgets/participants_invite_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ParticipantsInviteList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ParticipantsInviteBloc _bloc = Provider.of<ParticipantsInviteBloc>(context);
    return new SingleChildScrollView(
      child: new StreamBuilder(
        stream: _bloc.state,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.isLoading) return new Center(child: new CircularProgressIndicator());

            if(snapshot.data.participants != null) {
              List<TripParticipant> participants = snapshot.data.participants;
              return new ListView.builder(
                itemCount: participants.length,
                itemBuilder: (BuildContext context, int index) => new ParticipantItem(
                  participant: participants[index],
                ),
              );
            } else {
              return new Center(
                child: new Text(
                  'Participants list empty!\nSearch and invite participants!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              );
            }
          } else {
            return new Center(child: new CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
