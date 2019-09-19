import 'package:equatable/equatable.dart';

abstract class TripsEvent extends Equatable {
  TripsEvent([List props = const []]) : super(props);
}

class LoadTrips extends TripsEvent {}

class ShowTrip extends TripsEvent {}

class SearchTrips extends TripsEvent {
  final String searchValue;
  final DateTime fromDate;
  final DateTime toDate;

  SearchTrips({
		this.searchValue, 
		this.fromDate, 
		this.toDate
		}) : super([searchValue, fromDate, toDate]);
}

class CreateTrip extends TripsEvent {}
