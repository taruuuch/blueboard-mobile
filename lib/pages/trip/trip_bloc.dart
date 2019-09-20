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
      _loadTrip(tripId: event.id);
    }

    if (event is BackToTrips) {
      NavigationService.toTripsPage();
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
}
