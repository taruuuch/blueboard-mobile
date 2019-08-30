import 'package:bloc/bloc.dart';
import 'package:blueboard/providers/user_provider.dart';
import 'package:dio/dio.dart';

import 'signup_event.dart';
import 'signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  @override
  get initialState => SignUpState.initial();

  @override
  Stream<SignUpState> mapEventToState(SignUpEvent event) async* {
    if (event is SignUp) {
      yield* _signUp(email: event.email, password: event.password);
    }
  }

  Stream<SignUpState> _signUp({String email, String password}) async* {
    yield SignUpState.loading();

    try {
      await UserProvider().signUp(email, password);
      yield SignUpState.success();
    } on DioError catch (e) {
      if (e.response.data['code'].toString() == 'email_in_use')
        yield SignUpState.error('Email is already in use');
      else
        yield SignUpState.error(e.response.statusCode.toString());
    }
  }
}