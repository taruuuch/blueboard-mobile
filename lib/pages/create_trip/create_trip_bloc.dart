import 'package:bloc/bloc.dart';
import 'package:blueboard/models/country.dart';
import 'package:blueboard/models/trip.dart';
import 'package:blueboard/pages/create_trip/create_trip_event.dart';
import 'package:blueboard/pages/create_trip/create_trip_state.dart';
import 'package:blueboard/providers/trips_provider.dart';
import 'package:blueboard/services/navigation.dart';

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

    if (event is GetCountries) {
      yield* _getCountries();
    }

    if (event is Cancel) {
      NavigationService.toTripsPage();
    }
  }

  Stream<CreateTripState> _createTrip({Trip trip}) async* {
    yield CreateTripState.loading();

    try {
      await _tripsProvider.add(trip);
      yield CreateTripState.success(trip: trip);
    } catch (e) {
      yield CreateTripState.error(e.response.statusMessage.toString());
    }
  }

  Stream<CreateTripState> _getCountries() async* {
    yield CreateTripState.loading();

    try {
      List<Country> countries = await _tripsProvider.countries();
      yield CreateTripState.success(countries: countries);
    } catch (e) {
      yield CreateTripState.error(e.response.statusMessage.toString());
    }
  }
}