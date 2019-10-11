import 'package:bloc/bloc.dart';
import 'package:blueboard/models/participantInvite.dart';
import 'package:blueboard/models/tripParticipant.dart';
import 'package:blueboard/pages/participants_invite/participants_invite_event.dart';
import 'package:blueboard/pages/participants_invite/participants_invite_state.dart';
import 'package:blueboard/providers/participants_provider.dart';
import 'package:blueboard/providers/trips_provider.dart';
import 'package:blueboard/services/navigation.dart';

class ParticipantsInviteBloc extends Bloc<ParticipantsInviteEvent, ParticipantsInviteState> {
  final _participantsProvider = ParticipantsProvider();
  final _tripsProvider = TripsProvider();

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
      List<TripParticipant> participants = await _tripsProvider.participants(tripId);
      yield ParticipantsInviteState.success(participants: participants);
    } catch (e) {
      yield ParticipantsInviteState.error(e.response.statusMessage.toString());
    }
  }

  Stream<ParticipantsInviteState> _search({String searchValue}) async* {
    yield ParticipantsInviteState.loading();

    try {
      List<TripParticipant> participants = await _participantsProvider.search(searchValue);
      yield ParticipantsInviteState.success(participants: participants);
    } catch (e) {
      yield ParticipantsInviteState.error(e.response.statusMessage.toString());
    }
  }

  Stream<ParticipantsInviteState> _invite({ParticipantInvite participant}) async* {
    yield ParticipantsInviteState.loading();

    try {
      await _participantsProvider.invite(participant);
      yield ParticipantsInviteState.success();
    } catch (e) {
      yield ParticipantsInviteState.error(e.response.statusMessage.toString());
    }
  }

  Stream<ParticipantsInviteState> _delete({String id}) async* {
    yield ParticipantsInviteState.loading();

    try {
      await _participantsProvider.delete(id);
      yield ParticipantsInviteState.success();
    } catch (e) {
      yield ParticipantsInviteState.error(e.response.statusMessage.toString());
    }
  }

  Stream<ParticipantsInviteState> _skip({String tripId}) async* {
    yield ParticipantsInviteState.loading();

    try {
      yield ParticipantsInviteState.success();
      NavigationService.toTripsPage();
    } catch (e) {
      yield ParticipantsInviteState.error(e.response.statusMessage.toString());
    }
  }
}
