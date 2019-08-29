import 'package:flutter/foundation.dart';

class SignInState {
  final bool isLoading;
  final bool isLoginButtonEnabled;
  final String error;

  const SignInState({
    @required this.isLoading,
    @required this.isLoginButtonEnabled,
    @required this.error,
  });

  factory SignInState.initial() {
    return SignInState(
      isLoading: false,
      isLoginButtonEnabled: true,
      error: '',
    );
  }

  factory SignInState.loading() {
    return SignInState(
      isLoading: true,
      isLoginButtonEnabled: false,
      error: '',
    );
  }

  factory SignInState.error(String error) {
    return SignInState(
      isLoading: false,
      isLoginButtonEnabled: true,
      error: error,
    );
  }

  factory SignInState.success() {
    return SignInState(
      isLoading: false,
      isLoginButtonEnabled: true,
      error: '',
    );
  }
}