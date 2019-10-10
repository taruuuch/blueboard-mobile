import 'package:json_annotation/json_annotation.dart';

part 'participant.g.dart';

@JsonSerializable()
class Participant {
  Participant(
		this.firstName,
		this.lastName,
		this.username,
		this.avatar,
	);

  String firstName;
  String lastName;
  String username;
  String avatar;

  factory Participant.fromJson(Map<String, dynamic> json) => _$ParticipantFromJson(json);

  Map<String, dynamic> toJson() => _$ParticipantToJson(this);
}
