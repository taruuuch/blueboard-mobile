import 'package:bloc/bloc.dart';

import 'signin_event.dart';
import 'signin_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  @override
  get initialState => InitialSignInState();

  Stream<SignInLoadingState> get statusState => this
    .state
    .where((state) => state is SignInLoadingState)
    .cast<SignInLoadingState>();

  @override
  Stream<SignInState> mapEventToState(SignInEvent event) async* {
    if (event is SignIn) {
      yield* _signIn(email: event.email, password: event.password);
    }
  }

  Stream<SignInState> _signIn({String email, String password}) async* {
    yield SignInLoadingState();
  }
}