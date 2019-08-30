import 'package:equatable/equatable.dart';

abstract class SignInEvent extends Equatable {
  SignInEvent([List props = const []]) : super(props);
}

class SignIn extends SignInEvent {
  final String email;
  final String password;

  SignIn({this.email, this.password}):super([email, password]);
}

class GoToSignUpPage extends SignInEvent {}