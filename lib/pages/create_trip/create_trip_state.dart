import 'package:blueboard/models/country.dart';
import 'package:blueboard/models/trip.dart';
import 'package:flutter/foundation.dart';

class CreateTripState {
	final bool isLoading;
	final bool isCreateButtonEnabled;
	final String error;
  final Trip trip;
  final List<Country> countries;

	const CreateTripState({
		@required this.isLoading,
		@required this.isCreateButtonEnabled,
		@required this.error,
    @required this.trip,
    @required this.countries,
	});

	factory CreateTripState.initial() {
		return CreateTripState(
			isLoading: false,
			isCreateButtonEnabled: false,
			error: '',
      trip: null,
      countries: null,
		);
	}

  factory CreateTripState.loading() {
    return CreateTripState(
      isLoading: true,
      isCreateButtonEnabled: false,
      error: '',
      trip: null,
      countries: null,
    );
  }

  factory CreateTripState.error(String error) {
    return CreateTripState(
      isLoading: false,
      isCreateButtonEnabled: true,
      error: error,
      trip: null,
      countries: null,
    );
  }

  factory CreateTripState.success({trip, countries}) {
    return CreateTripState(
      isLoading: false,
      isCreateButtonEnabled: true,
      error: '',
      trip: trip,
      countries: countries,
    );
  }
}