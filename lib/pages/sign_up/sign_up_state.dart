import 'package:flutter/foundation.dart';

class SignUpState {
  final bool isLoading;
  final bool isLoginButtonEnabled;
  final String error;

  const SignUpState({
    @required this.isLoading,
    @required this.isLoginButtonEnabled,
    @required this.error,
  });

  factory SignUpState.initial() {
    return SignUpState(
      isLoading: false,
      isLoginButtonEnabled: true,
      error: '',
    );
  }

  factory SignUpState.loading() {
    return SignUpState(
      isLoading: true,
      isLoginButtonEnabled: false,
      error: '',
    );
  }

  factory SignUpState.error(String error) {
    return SignUpState(
      isLoading: false,
      isLoginButtonEnabled: true,
      error: error,
    );
  }

  factory SignUpState.success() {
    return SignUpState(
      isLoading: false,
      isLoginButtonEnabled: true,
      error: '',
    );
  }
}