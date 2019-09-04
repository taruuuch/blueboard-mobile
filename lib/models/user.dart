import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  User(
		this.id, 
		this.firstName, 
		this.lastName,
		this.status,
		this.email, 
		this.phone, 
		this.password,
		// this.avatar
	);

  String id;
  String firstName;
  String lastName;
	String email;
	String phone;
	String password;
	int status;
	// Uri avatar;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}