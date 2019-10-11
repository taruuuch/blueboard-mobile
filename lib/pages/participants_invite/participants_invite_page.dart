import 'package:blueboard/configs/app_constans.dart';
import 'package:blueboard/configs/app_style.dart';
import 'package:blueboard/pages/participants_invite/widgets/participants_invite_search.dart';
import 'package:blueboard/widgets/drawer/drawer.dart';
import 'package:flutter/material.dart';

class ParticipantsInvitePage extends StatelessWidget {
  static const String tag = 'participants-invite';

  final String tripId;

  const ParticipantsInvitePage({Key key, this.tripId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
				title: new Text(AppConstants.participantsInviteTitle),
				centerTitle: true,
				backgroundColor: Colors.white,
			),
      drawer: AppDrawer(),
      body: new Container(
        padding: const EdgeInsets.all(AppStyle.formPadding),
        child: new ParticipantsInviteSearch(tripId),
      ),
    );
  }
}
