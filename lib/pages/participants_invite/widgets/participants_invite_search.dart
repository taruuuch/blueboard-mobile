import 'package:blueboard/configs/app_constans.dart';
import 'package:blueboard/configs/app_style.dart';
import 'package:blueboard/models/tripParticipant.dart';
import 'package:blueboard/models/user.dart';
import 'package:blueboard/pages/participants_invite/participants_invite_bloc.dart';
import 'package:blueboard/pages/participants_invite/participants_invite_event.dart';
import 'package:blueboard/pages/participants_invite/widgets/participants_invite_list.dart';
import 'package:blueboard/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ParticipantsInviteSearch extends StatefulWidget {
  final String tripId;

  ParticipantsInviteSearch(
    this.tripId
  ) : super();

  @override
  State createState() => _ParticipantsInviteSearchState();
}

class _ParticipantsInviteSearchState extends State<ParticipantsInviteSearch> {
  TextEditingController _searchController = new TextEditingController();
  ParticipantsInviteBloc _bloc;

  User selectedUser;
  String tripId;

  @override
  void initState() {
    super.initState();
    setState(() {
      tripId = widget.tripId;
    });
    Future.delayed(Duration.zero, _loadParticipants);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bloc = Provider.of<ParticipantsInviteBloc>(context);
  }

  void _loadParticipants() {
    _bloc.dispatch(Load(
      tripId: tripId
    ));
  }

  void _onSearchSubmited(ParticipantsInviteBloc _bloc) {
    String searchValue = _searchController.text;
    if(searchValue.isEmpty)
      _loadParticipants();
    else
      _bloc.dispatch(Search(
        searchValue: searchValue
      ));
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new StreamBuilder(
          stream: _bloc.state,
          builder: (context, snapshot) {
            return new InputField(
              controller: _searchController,
              labelText: AppConstants.participantsInviteSearchLabel,
              fieldSubmitted: (value) => _onSearchSubmited(_bloc),
              onChanged: (value) => _onSearchSubmited(_bloc),
            );
          },
        ),
        new SizedBox(height: AppStyle.primaryPadding),
        Expanded(
          child: new StreamBuilder(
            stream: _bloc.state,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data.isLoading) return new Center(child: new CircularProgressIndicator());

                if(snapshot.data.participants.isNotEmpty) {
                  List<TripParticipant> participants = snapshot.data.participants;
                  return new ParticipantsInviteList(participants);
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
        ),
      ],
    );
  }
}
