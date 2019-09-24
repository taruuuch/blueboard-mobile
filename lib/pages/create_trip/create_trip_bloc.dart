import 'package:bloc/bloc.dart';
import 'package:blueboard/models/trip.dart';
import 'package:blueboard/pages/create_trip/create_trip_event.dart';
import 'package:blueboard/pages/create_trip/create_trip_state.dart';
import 'package:blueboard/providers/trips_provider.dart';

class CreateTripBloc extends Bloc<CreateTripEvent, CreateTripState> {
  final _tripsProvider = TripsProvider();
  Trip trip;

  @override
  get initialState => CreateTripState.initial();

  @override
  Stream<CreateTripState> mapEventToState(CreateTripEvent event) async* {
    if (event is CreateTrip) {
      yield* _createTrip(trip: trip);
    }
  }

  Stream<CreateTripState> _createTrip({Trip trip}) async* {
    yield CreateTripState.loading();

    try {
      await _tripsProvider.add(trip);
      yield CreateTripState.success(trip);
    } catch (e) {
      yield CreateTripState.error(e.response.statusMessage.toString());
    }
  }
}