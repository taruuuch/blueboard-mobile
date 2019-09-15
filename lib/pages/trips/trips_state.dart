import 'package:blueboard/models/trip.dart';
import 'package:flutter/foundation.dart';

class TripsState {
	final bool isLoading;
	final bool isSearchButtonEnabled;
  final List<Trip> trips;
	final String error;

	const TripsState({
		@required this.isLoading,
		@required this.isSearchButtonEnabled,
		@required this.error,
    this.trips,
	});

	factory TripsState.initial() {
		return TripsState(
			isLoading: false,
			isSearchButtonEnabled: false,
			error: '',
      trips: []
		);
	}

  factory TripsState.loading() {
    return TripsState(
      isLoading: true,
      isSearchButtonEnabled: false,
      error: '',
      trips: []
    );
  }

  factory TripsState.error(String error) {
    return TripsState(
      isLoading: false,
      isSearchButtonEnabled: true,
      error: error,
      trips: []
    );
  }

  factory TripsState.success(trips) {
    return TripsState(
      isLoading: false,
      isSearchButtonEnabled: true,
      error: '',
      trips: trips
    );
  }
}