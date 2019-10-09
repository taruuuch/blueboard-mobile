import 'package:blueboard/models/createTrip.dart';
import 'package:equatable/equatable.dart';

abstract class CreateTripEvent extends Equatable {
  CreateTripEvent([List props = const []]) : super(props);
}

class AddTrip extends CreateTripEvent {
  final CreateTrip trip;

  AddTrip({this.trip}) : super([trip]);
}

class Cancel extends CreateTripEvent {}

class GetCountries extends CreateTripEvent {}