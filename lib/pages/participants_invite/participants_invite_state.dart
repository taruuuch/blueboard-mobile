import 'package:blueboard/models/tripParticipant.dart';
import 'package:flutter/foundation.dart';

class ParticipantsInviteState {
	final bool isLoading;
	final bool isAddButtonEnabled;
	final String error;
  final List<TripParticipant> participants;

	const ParticipantsInviteState({
		@required this.isLoading,
		@required this.isAddButtonEnabled,
		@required this.error,
    @required this.participants,
	});

	factory ParticipantsInviteState.initial() {
		return ParticipantsInviteState(
			isLoading: false,
			isAddButtonEnabled: false,
			error: '',
      participants: null,
		);
	}

  factory ParticipantsInviteState.loading() {
    return ParticipantsInviteState(
      isLoading: true,
      isAddButtonEnabled: false,
      error: '',
      participants: null,
    );
  }

  factory ParticipantsInviteState.error(String error) {
    return ParticipantsInviteState(
      isLoading: false,
      isAddButtonEnabled: true,
      error: error,
      participants: null,
    );
  }

  factory ParticipantsInviteState.success({List<TripParticipant> participants}) {
    return ParticipantsInviteState(
      isLoading: false,
      isAddButtonEnabled: true,
      error: '',
      participants: participants,
    );
  }
}
