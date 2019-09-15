import 'package:bloc/bloc.dart';
import 'package:blueboard/models/trip.dart';
import 'package:blueboard/pages/trips/trips_event.dart';
import 'package:blueboard/pages/trips/trips_state.dart';
import 'package:blueboard/providers/trips_provider.dart';

class TripsBloc extends Bloc<TripsEvent, TripsState> {
  final _tripsProvider = TripsProvider();
  List<Trip> trips;

  @override
  get initialState => TripsState.initial();

  @override
  Stream<TripsState> mapEventToState(TripsEvent event) async* {
    if (event is LoadTrips) {
      yield* _loadTrips();
    }

		if (event is SearchTrips) {
      yield* _searchTrips();
		}

    if (event is CreateTrip) {
      yield* _createTrip();
    }

    if (event is ShowTrip) {
      yield* _showTrip();
    }
  }  
	
	Stream<TripsState> _showTrip() async* {

  }

  Stream<TripsState> _loadTrips() async* {
    yield TripsState.loading();

    try {
      trips = await _tripsProvider.getAll();
      yield TripsState.success(trips);
    } catch (e) {
      yield TripsState.error(e.response.statusMessage.toString());
    }
  }

	Stream<TripsState> _searchTrips({String searchParam, String from, String to}) async* {

  }

  Stream<TripsState> _createTrip() async* {

  }
}
