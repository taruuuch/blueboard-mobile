import 'package:flutter/foundation.dart';

class FirstSetupState {
  final bool isLoading;
  final bool isLoginButtonEnabled;
  final String error;

  const FirstSetupState({
    @required this.isLoading,
    @required this.isLoginButtonEnabled,
    @required this.error,
  });

  factory FirstSetupState.initial() {
    return FirstSetupState(
      isLoading: false,
      isLoginButtonEnabled: true,
      error: '',
    );
  }

  factory FirstSetupState.loading() {
    return FirstSetupState(
      isLoading: true,
      isLoginButtonEnabled: false,
      error: '',
    );
  }

  factory FirstSetupState.error(String error) {
    return FirstSetupState(
      isLoading: false,
      isLoginButtonEnabled: true,
      error: error,
    );
  }

  factory FirstSetupState.success() {
    return FirstSetupState(
      isLoading: false,
      isLoginButtonEnabled: true,
      error: '',
    );
  }
}