import 'package:blueboard/models/trip.dart';
import 'package:blueboard/pages/trips/trips_event.dart';
import 'package:equatable/equatable.dart';

abstract class CreateTripEvent extends Equatable {
  CreateTripEvent([List props = const []]) : super(props);
}

class LoadCountry extends TripsEvent {
  final Trip trip;

  LoadCountry({this.trip}) : super([trip]);
}

class CreateTrip extends TripsEvent {}

class BackToTrips extends TripsEvent {}