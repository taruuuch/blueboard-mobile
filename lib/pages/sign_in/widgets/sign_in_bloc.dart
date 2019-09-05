import 'package:bloc/bloc.dart';
import 'package:blueboard/pages/sign_in/widgets/sign_in_event.dart';
import 'package:blueboard/pages/sign_in/widgets/sign_in_state.dart';
import 'package:blueboard/providers/user_provider.dart';
import 'package:blueboard/services/navigation.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
	final _userProvider = UserProvider();

  @override
  get initialState => SignInState.initial();

  @override
  Stream<SignInState> mapEventToState(SignInEvent event) async* {
    if (event is SignIn) {
      yield* _signIn(email: event.email, password: event.password);
    }

    if (event is GoToSignUpPage) {
      NavigationService.toSignUpPage();
    }
  }

  Stream<SignInState> _signIn({String email, String password}) async* {
    yield SignInState.loading();

    try {
      await _userProvider.signIn(email, password);
      yield SignInState.success();

			var user = await _userProvider.get();

			if (user.status == 1)
				NavigationService.toFirstSetupPage();
			else
				NavigationService.toTripsPage();
				
    } catch (e) {
      yield SignInState.error(e.response.statusMessage.toString());
    }
  }
}
