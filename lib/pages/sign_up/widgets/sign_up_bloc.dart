import 'package:blueboard/pages/sign_up/widgets/sign_up_event.dart';
import 'package:blueboard/pages/sign_up/widgets/sign_up_state.dart';
import 'package:blueboard/providers/user_provider.dart';
import 'package:blueboard/services/navigation.dart';
import 'package:dio/dio.dart';
import 'package:bloc/bloc.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
	final _userProvider = UserProvider();

  @override
  get initialState => SignUpState.initial();

  @override
  Stream<SignUpState> mapEventToState(SignUpEvent event) async* {
    if (event is SignUp) {
      yield* _signUp(email: event.email, password: event.password);
    }

    if (event is Cancel) {
      NavigationService.toSignInPage();
    }
  }

  Stream<SignUpState> _signUp({String email, String password}) async* {
    yield SignUpState.loading();

    try {
      await _userProvider.signUp(email, password);
      yield SignUpState.success();
      NavigationService.toFirstSetupPage();
    } on DioError catch (e) {
      yield SignUpState.error(e.response.data['code'].toString());
    }
  }
}