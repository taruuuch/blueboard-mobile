import 'package:equatable/equatable.dart';

abstract class TripEvent extends Equatable {
  TripEvent([List props = const []]) : super(props);
}

class LoadTrip extends TripEvent {}

class BackToTrip extends TripEvent {}
