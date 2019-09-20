import 'package:blueboard/models/trip.dart';
import 'package:flutter/foundation.dart';

class TripState {
	final bool isLoading;
	final String error;
  final Trip trip;

	const TripState({
		@required this.isLoading,
		@required this.error,
    @required this.trip
	});

	factory TripState.initial() {
		return TripState(
			isLoading: false,
			error: '',
      trip: null,
		);
	}

  factory TripState.loading() {
    return TripState(
      isLoading: true,
      error: '',
      trip: null,
    );
  }

  factory TripState.error(String error) {
    return TripState(
      isLoading: false,
      error: error,
      trip: null
    );
  }

  factory TripState.success(Trip trip) {
    return TripState(
      isLoading: false,
      error: '',
      trip: trip
    );
  }
}