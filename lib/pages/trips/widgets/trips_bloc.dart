import 'package:bloc/bloc.dart';
import 'package:blueboard/pages/trips/widgets/trips_event.dart';
import 'package:blueboard/pages/trips/widgets/trips_state.dart';
import 'package:blueboard/services/navigation.dart';

class TripsBloc extends Bloc<TripsEvent, TripsState> {
  @override
  get initialState => TripsState.initial();

  @override
  Stream<TripsState> mapEventToState(TripsEvent event) async* {
    if (event is LoadTrips) {

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

  }

	Stream<TripsState> _searchTrips() async* {

  }
}
