import 'package:json_annotation/json_annotation.dart';

part 'tripParticipant.g.dart';

@JsonSerializable()
class TripParticipant {
  TripParticipant(
		this.id,
		this.firstName,
		this.lastName,
		this.role,
    this.username,
    this.avatar,
	);

  String id;
  String firstName;
  String lastName;
  int role;
  String username;
  String avatar;

  factory TripParticipant.fromJson(Map<String, dynamic> json) => _$TripParticipantFromJson(json);

  Map<String, dynamic> toJson() => _$TripParticipantToJson(this);
}
