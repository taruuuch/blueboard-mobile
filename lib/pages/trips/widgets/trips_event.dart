import 'package:equatable/equatable.dart';

abstract class TripsEvent extends Equatable {
  TripsEvent([List props = const []]) : super(props);
}

class LoadTrips extends TripsEvent {}

class ShowTrips extends TripsEvent {}

class SearchTrips extends TripsEvent {
  final String searchParams;
  final DateTime startDate;
  final DateTime endDate;

  SearchTrips({
		this.searchParams, 
		this.startDate, 
		this.endDate
		}) : super([searchParams, startDate, endDate]);
}

class CreateTrip extends TripsEvent {}
