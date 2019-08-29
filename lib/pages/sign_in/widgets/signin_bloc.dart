import 'package:bloc/bloc.dart';
import 'package:blueboard/providers/user_provider.dart';

import 'signin_event.dart';
import 'signin_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  @override
  get initialState => SignInState.initial();

  @override
  Stream<SignInState> mapEventToState(SignInEvent event) async* {
    if (event is SignIn) {
      yield* _signIn(email: event.email, password: event.password);
    }
  }

  Stream<SignInState> _signIn({String email, String password}) async* {
    yield SignInState.loading();

    try {
      await UserProvider().signIn(email, password);
      yield SignInState.success();
    } catch (e) {
      yield SignInState.error('sign in error');
    }
  }
}
