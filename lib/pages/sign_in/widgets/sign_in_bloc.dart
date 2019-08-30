import 'package:bloc/bloc.dart';
import 'package:blueboard/pages/sign_in/widgets/sign_in_event.dart';
import 'package:blueboard/pages/sign_in/widgets/sign_in_state.dart';
import 'package:blueboard/pages/trips/trips_screen.dart';
import 'package:blueboard/providers/user_provider.dart';
import 'package:blueboard/services/navigation.dart';
import 'package:dio/dio.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
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
      await UserProvider().signIn(email, password);
      yield SignInState.success();
      NavigationService.navigateTo(TripPage.tag);
    } on DioError catch (e) {
      yield SignInState.error(e.response.statusMessage.toString());
    }
  }
}
