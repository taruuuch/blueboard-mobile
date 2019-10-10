import 'package:json_annotation/json_annotation.dart';

part 'participantInvite.g.dart';

@JsonSerializable()
class ParticipantInvite {
  ParticipantInvite(
		this.username,
		this.tripId,
		this.role,
	);

  String username;
  String tripId;
  int role;

  factory ParticipantInvite.fromJson(Map<String, dynamic> json) => _$ParticipantInviteFromJson(json);

  Map<String, dynamic> toJson() => _$ParticipantInviteToJson(this);
}
