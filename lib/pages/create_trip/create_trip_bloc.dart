import 'package:bloc/bloc.dart';
import 'package:blueboard/models/country.dart';
import 'package:blueboard/models/createTrip.dart';
import 'package:blueboard/pages/create_trip/create_trip_event.dart';
import 'package:blueboard/pages/create_trip/create_trip_state.dart';
import 'package:blueboard/pages/participants_invite/participants_invite_page.dart';
import 'package:blueboard/providers/trips_provider.dart';
import 'package:blueboard/services/navigation.dart';

class CreateTripBloc extends Bloc<CreateTripEvent, CreateTripState> {
  final _tripsProvider = TripsProvider();
  List<Country> countries;

  @override
  get initialState => CreateTripState.initial();

  @override
  Stream<CreateTripState> mapEventToState(CreateTripEvent event) async* {
    if (event is AddTrip) {
      yield* _nextStep(trip: event.trip);
    }

    if (event is GetCountries) {
      yield* _getCountries();
    }

    if (event is Cancel) {
      NavigationService.toTripsPage();
    }
  }

  Stream<CreateTripState> _nextStep({CreateTrip trip}) async* {
    yield CreateTripState.loading();

    try {
      String tripId = await _tripsProvider.add(trip);
      yield CreateTripState.success();
      NavigationService.navigateTo(ParticipantsInvitePage.tag, arguments: tripId);
    } catch (e) {
      yield CreateTripState.error(e.response.statusMessage.toString());
    }
  }

  Stream<CreateTripState> _getCountries() async* {
    yield CreateTripState.loading();

    try {
      countries = await _tripsProvider.countries();
      yield CreateTripState.success(countries: countries);
    } catch (e) {
      yield CreateTripState.error(e.response.statusMessage.toString());
    }
  }
}
