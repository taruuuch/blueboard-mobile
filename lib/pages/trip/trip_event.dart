import 'package:equatable/equatable.dart';

abstract class TripEvent extends Equatable {
  TripEvent([List props = const []]) : super(props);
}

class LoadTrip extends TripEvent {
  final String id;

  LoadTrip({this.id}) : super([id]);
}

class BackToTrips extends TripEvent {}
