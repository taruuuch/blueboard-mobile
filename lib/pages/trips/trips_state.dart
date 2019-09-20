import 'package:blueboard/models/trip.dart';
import 'package:flutter/foundation.dart';

class TripsState {
	final bool isLoading;
	final bool isSearchButtonEnabled;
  final List<Trip> trips;
  final String searchValue;
  final DateTime fromDate;
  final DateTime toDate;
	final String error;

	const TripsState({
		@required this.isLoading,
		@required this.isSearchButtonEnabled,
		@required this.error,
    @required this.trips,
    @required this.searchValue,
    @required this.fromDate,
    @required this.toDate
	});

	factory TripsState.initial() {
		return TripsState(
			isLoading: false,
			isSearchButtonEnabled: false,
			error: '',
      trips: [],
      searchValue: '',
      fromDate: null,
      toDate: null,
		);
	}

  factory TripsState.loading() {
    return TripsState(
      isLoading: true,
      isSearchButtonEnabled: false,
      error: '',
      trips: [],
      searchValue: '',
      fromDate: null,
      toDate: null,
    );
  }

  factory TripsState.error(String error) {
    return TripsState(
      isLoading: false,
      isSearchButtonEnabled: true,
      error: error,
      trips: [],
      searchValue: '',
      fromDate: null,
      toDate: null,
    );
  }

  factory TripsState.success(trips, {searchValue, fromDate, toDate}) {
    return TripsState(
      isLoading: false,
      isSearchButtonEnabled: true,
      error: '',
      trips: trips,
      searchValue: searchValue,
      fromDate: fromDate,
      toDate: toDate,
    );
  }
}