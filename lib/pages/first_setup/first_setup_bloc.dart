import 'package:blueboard/pages/first_setup/first_setup_event.dart';
import 'package:blueboard/pages/first_setup/first_setup_state.dart';
import 'package:blueboard/providers/user_provider.dart';
import 'package:blueboard/services/navigation.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

class FirstSetupBloc extends Bloc<FirstSetupEvent, FirstSetupState> {
	final _userProvider = UserProvider();

	@override
	get initialState => FirstSetupState.initial();

	@override
	Stream<FirstSetupState> mapEventToState(FirstSetupEvent event) async* {
		if (event is SaveUserData) {
			yield* _saveProfile(firstName: event.firstName, lastName: event.lastName);
		}
	}

	Stream<FirstSetupState> _saveProfile({String firstName, String lastName}) async* {
		yield FirstSetupState.loading();

		try {
			await _userProvider.initialUpdate(firstName, lastName);
			yield FirstSetupState.success();
			NavigationService.toTripsPage();
		} on DioError catch (e) {
			yield FirstSetupState.error(e.response.statusMessage.toString());
		}
	}
}