import 'package:flutter/foundation.dart';

class TripsState {
	final bool isLoading;
	final bool isSearchButtonEnabled;
	final String error;

	const TripsState({
		@required this.isLoading,
		@required this.isSearchButtonEnabled,
		@required this.error,
	});

	factory TripsState.initial() {
		return TripsState(
			isLoading: false,
			isSearchButtonEnabled: false,
			error: '',
		);
	}

  factory TripsState.loading() {
    return TripsState(
      isLoading: true,
      isSearchButtonEnabled: false,
      error: '',
    );
  }

  factory TripsState.error(String error) {
    return TripsState(
      isLoading: false,
      isSearchButtonEnabled: true,
      error: error,
    );
  }

  factory TripsState.success() {
    return TripsState(
      isLoading: false,
      isSearchButtonEnabled: true,
      error: '',
    );
  }
}