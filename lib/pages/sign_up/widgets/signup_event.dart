import 'package:equatable/equatable.dart';

abstract class SignUpEvent extends Equatable {
  SignUpEvent([List props = const []]) : super(props);
}

class SignUp extends SignUpEvent {
  final String email;
  final String password;

  SignUp({this.email, this.password}):super([email, password]);
}