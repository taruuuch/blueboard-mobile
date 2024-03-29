import 'package:bloc/bloc.dart';
import 'package:blueboard/models/trip.dart';
import 'package:blueboard/pages/trip/trip_event.dart';
import 'package:blueboard/pages/trip/trip_state.dart';
import 'package:blueboard/providers/trips_provider.dart';
import 'package:blueboard/services/navigation.dart';

class TripBloc extends Bloc<TripEvent, TripState> {
  final _tripsProvider = TripsProvider();
  Trip trip;

  @override
  get initialState => TripState.initial();

  @override
  Stream<TripState> mapEventToState(TripEvent event) async* {
    if (event is LoadTrip) {
      yield* _loadTrip(tripId: event.id);
    }

    if (event is BackToTrips) {
      NavigationService.toTripsPage();
    }

    if (event is DeleteTrip) {
      yield* _deleteTrip(tripId: event.id);
    }
  }  
	
  Stream<TripState> _loadTrip({String tripId}) async* {
    yield TripState.loading();

    try {
      trip = await _tripsProvider.get(tripId);
      yield TripState.success(trip);
    } catch (e) {
      yield TripState.error(e.response.statusMessage.toString());
    }
  }

  Stream<TripState> _deleteTrip({String tripId}) async* {
    yield TripState.loading();

    try {
      await _tripsProvider.delete(tripId);
      NavigationService.toTripsPage();
    } catch (e) {
      yield TripState.error(e.response.statusMessage.toString());
    }
  }
}
