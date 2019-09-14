import 'package:bloc/bloc.dart';
import 'package:blueboard/pages/trips/trips_event.dart';
import 'package:blueboard/pages/trips/trips_state.dart';
import 'package:blueboard/providers/trips_provider.dart';
import 'package:blueboard/services/navigation.dart';

class TripsBloc extends Bloc<TripsEvent, TripsState> {
  final _tripsProvider = TripsProvider();

  @override
  get initialState => TripsState.initial();

  @override
  Stream<TripsState> mapEventToState(TripsEvent event) async* {
    if (event is LoadTrips) {
      yield* _tripsLoad();
    }

		if (event is SearchTrips) {

		}

    if (event is CreateTrip) {

    }

    if (event is ShowTrips) {

    }
  }  
	
	Stream<TripsState> _showTrips() async* {

  }

  Stream<TripsState> _tripsLoad() async* {
    yield TripsState.loading();

    try {
      await _tripsProvider.getAll();
      yield TripsState.success();
    } catch (e) {
      yield TripsState.error(e.response.statusMessage.toString());
    }
  }

	Stream<TripsState> _searchTrips() async* {

  }
}
