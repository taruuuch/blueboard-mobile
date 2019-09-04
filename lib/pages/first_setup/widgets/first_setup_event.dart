import 'package:equatable/equatable.dart';

abstract class FirstSetupEvent extends Equatable {
	FirstSetupEvent([List props = const []]) : super(props);
}

class SaveUserData extends FirstSetupEvent {
	final String firstName;
	final String lastName;

	SaveUserData(this.firstName, this.lastName) : super([firstName, lastName]);
}