import 'package:equatable/equatable.dart';

abstract class SignInEvent extends Equatable {
  SignInEvent([List props = const []]) : super(props);
}

class SignIn extends SignInEvent {
  final String login;
  final String password;

  SignIn({this.login, this.password}):super([login, password]);
}

class GoToSignUpPage extends SignInEvent {}