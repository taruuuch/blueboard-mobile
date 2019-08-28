import 'package:equatable/equatable.dart';

abstract class SignInState extends Equatable {}

class InitialSignInState extends SignInState {
  
}

class SignInLoadingState extends SignInState {
  @override
  String toString() => 'SignInLoading';
}

class SignInSuccessState extends SignInState {
  @override
  String toString() => 'SignInSuccess';
}

class SignInErrorState extends SignInState {
  @override
  String toString() => 'SignInError';
}