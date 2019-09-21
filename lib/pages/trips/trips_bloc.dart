import 'package:bloc/bloc.dart';
import 'package:blueboard/models/tripSlim.dart';
import 'package:blueboard/pages/trips/trips_event.dart';
import 'package:blueboard/pages/trips/trips_state.dart';
import 'package:blueboard/providers/trips_provider.dart';

class TripsBloc extends Bloc<TripsEvent, TripsState> {
  final _tripsProvider = TripsProvider();
  List<TripSlim> trips;

  @override
  get initialState => TripsState.initial();

  @override
  Stream<TripsState> mapEventToState(TripsEvent event) async* {
    if (event is LoadTrips) {
      yield* _loadTrips();
    }

		if (event is SearchTrips) {
      yield* _searchTrips(searchValue: event.searchValue, fromDate: event.fromDate, toDate: event.toDate);
		}

    if (event is CreateTrip) {
      yield* _createTrip();
    }

    if (event is ShowTrip) {
      yield* _showTrip();
    }
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

	Stream<TripsState> _searchTrips({String searchValue, DateTime fromDate, DateTime toDate}) async* {
    yield TripsState.loading();

    try {
      trips = await _tripsProvider.search(searchValue: searchValue, fromDate: fromDate, toDate: toDate);
      yield TripsState.success(trips, searchValue: searchValue, fromDate: fromDate, toDate: toDate);
    } catch (e) {
      yield TripsState.error(e.response.statusMessage.toString());
    }
  }

  Stream<TripsState> _createTrip() async* {}

	Stream<TripsState> _showTrip() async* {}
}
