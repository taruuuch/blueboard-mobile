import 'package:blueboard/configs/app_constans.dart';
import 'package:blueboard/configs/app_style.dart';
import 'package:blueboard/models/user.dart';
import 'package:blueboard/pages/participants_invite/participants_invite_bloc.dart';
import 'package:blueboard/pages/participants_invite/participants_invite_event.dart';
import 'package:blueboard/pages/participants_invite/widgets/participants_invite_list.dart';
import 'package:blueboard/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ParticipantsInviteSearch extends StatefulWidget {
  @override
  State createState() => _ParticipantsInviteSearchState();
}

class _ParticipantsInviteSearchState extends State<ParticipantsInviteSearch> {
  TextEditingController _searchController = new TextEditingController();

  User selectedUser;

  @override
  void initState() {
    super.initState();
  }

  void _onSearchSubmited(ParticipantsInviteBloc _bloc) {
    _bloc.dispatch(Search(
      searchValue: _searchController.text
    ));
  }

  @override
  Widget build(BuildContext context) {
    final ParticipantsInviteBloc _bloc = Provider.of<ParticipantsInviteBloc>(context);

    return new Column(
      children: <Widget>[
        new StreamBuilder(
          stream: _bloc.state,
          builder: (context, snapshot) {
            return new InputField(
              controller: _searchController,
              labelText: AppConstants.participantsInviteSearchLabel,
              fieldSubmitted: (value) => _onSearchSubmited(_bloc),
            );
          },
        ),
        new SizedBox(height: AppStyle.primaryPadding),
        new ParticipantsInviteList(),
      ],
    );
  }
}
