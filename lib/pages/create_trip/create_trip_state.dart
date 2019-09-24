import 'package:blueboard/models/trip.dart';
import 'package:flutter/foundation.dart';

class CreateTripState {
	final bool isLoading;
	final bool isCreateButtonEnabled;
	final String error;
  final Trip trip;

	const CreateTripState({
		@required this.isLoading,
		@required this.isCreateButtonEnabled,
		@required this.error,
    @required this.trip,
	});

	factory CreateTripState.initial() {
		return CreateTripState(
			isLoading: false,
			isCreateButtonEnabled: false,
			error: '',
      trip: null,
		);
	}

  factory CreateTripState.loading() {
    return CreateTripState(
      isLoading: true,
      isCreateButtonEnabled: false,
      error: '',
      trip: null,
    );
  }

  factory CreateTripState.error(String error) {
    return CreateTripState(
      isLoading: false,
      isCreateButtonEnabled: true,
      error: error,
      trip: null,
    );
  }

  factory CreateTripState.success(trip) {
    return CreateTripState(
      isLoading: false,
      isCreateButtonEnabled: true,
      error: '',
      trip: trip,
    );
  }
}