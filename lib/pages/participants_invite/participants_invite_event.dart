import 'package:blueboard/models/participantInvite.dart';
import 'package:equatable/equatable.dart';

abstract class ParticipantsInviteEvent extends Equatable {
  ParticipantsInviteEvent([List props = const []]) : super(props);
}

class Load extends ParticipantsInviteEvent {
  final String tripId;

  Load({this.tripId}) : super([tripId]);
}

class Search extends ParticipantsInviteEvent {
  final String searchValue;

  Search({this.searchValue}) : super([searchValue]);
}

class Invite extends ParticipantsInviteEvent {
  final ParticipantInvite participant;

  Invite({this.participant}) : super([participant]);
}

class Delete extends ParticipantsInviteEvent {
  final String id;

  Delete({this.id}) : super([id]);
}

class Skip extends ParticipantsInviteEvent {
  final String tripId;

  Skip({this.tripId}) : super([tripId]);
}
