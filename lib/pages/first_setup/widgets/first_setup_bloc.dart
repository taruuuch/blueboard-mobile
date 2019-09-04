import 'package:blueboard/pages/first_setup/widgets/first_setup_event.dart';
import 'package:blueboard/pages/first_setup/widgets/first_setup_state.dart';
import 'package:blueboard/services/navigation.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

class FirstSetupBloc extends Bloc<FirstSetupEvent, FirstSetupState> {
	@override
	get initialState => FirstSetupState.initial();

	@override
	Stream<FirstSetupState> mapEventToState(FirstSetupEvent event) async* {
		if (event is SaveUserData) {
			yield* _saveProfile();
		}
	}

	Stream<FirstSetupState> _saveProfile() async* {
		yield FirstSetupState.loading();

		try {
			yield FirstSetupState.success();
			NavigationService.toTripsPage();
		} on DioError catch (e) {
			yield FirstSetupState.error(e.response.statusMessage.toString());
		}
	}
}