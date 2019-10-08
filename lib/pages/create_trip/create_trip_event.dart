import 'package:blueboard/models/trip.dart';
import 'package:equatable/equatable.dart';

abstract class CreateTripEvent extends Equatable {
  CreateTripEvent([List props = const []]) : super(props);
}

class LoadCountry extends CreateTripEvent {
  final Trip trip;

  LoadCountry({this.trip}) : super([trip]);
}

class CreateTrip extends CreateTripEvent {}

class Cancel extends CreateTripEvent {}

class GetCountries extends CreateTripEvent {}