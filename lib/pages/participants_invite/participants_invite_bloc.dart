import 'package:bloc/bloc.dart';
import 'package:blueboard/models/participantInvite.dart';
import 'package:blueboard/pages/participants_invite/participants_invite_event.dart';
import 'package:blueboard/pages/participants_invite/participants_invite_state.dart';
import 'package:blueboard/providers/participants_provider.dart';
import 'package:blueboard/services/navigation.dart';

class ParticipantsInviteBloc extends Bloc<ParticipantsInviteEvent, ParticipantsInviteState> {
  final _participantsProvider = ParticipantsProvider();

  @override
  get initialState => ParticipantsInviteState.initial();

  @override
  Stream<ParticipantsInviteState> mapEventToState(ParticipantsInviteEvent event) async* {
    if (event is Load) {
      yield* _load(tripId: event.tripId);
    }

    if (event is Search) {
      yield* _search(searchValue: event.searchValue);
    }

    if (event is Invite) {
      yield* _invite(participant: event.participant);
    }

    if (event is Delete) {
      yield* _delete(id: event.id);
    }

    if (event is Skip) {
      yield* _skip(tripId: event.tripId);
    }
  }

  Stream<ParticipantsInviteState> _load({String tripId}) async* {
    yield ParticipantsInviteState.loading();

    try {

    } catch (e) {
      yield ParticipantsInviteState.error(e.response.statusMessage.toString());
    }
  }

  Stream<ParticipantsInviteState> _search({String searchValue}) async* {
    yield ParticipantsInviteState.loading();

    try {
      await _participantsProvider.search(searchValue);
    } catch (e) {
      yield ParticipantsInviteState.error(e.response.statusMessage.toString());
    }
  }

  Stream<ParticipantsInviteState> _invite({ParticipantInvite participant}) async* {
    yield ParticipantsInviteState.loading();

    try {
      await _participantsProvider.invite(participant);
    } catch (e) {
      yield ParticipantsInviteState.error(e.response.statusMessage.toString());
    }
  }

  Stream<ParticipantsInviteState> _delete({String id}) async* {
    yield ParticipantsInviteState.loading();

    try {
      await _participantsProvider.delete(id);
    } catch (e) {
      yield ParticipantsInviteState.error(e.response.statusMessage.toString());
    }
  }

  Stream<ParticipantsInviteState> _skip({String tripId}) async* {
    yield ParticipantsInviteState.loading();

    try {
      NavigationService.toTripsPage();
    } catch (e) {
      yield ParticipantsInviteState.error(e.response.statusMessage.toString());
    }
  }
}
