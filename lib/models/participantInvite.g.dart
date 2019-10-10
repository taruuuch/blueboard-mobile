// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'participantInvite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ParticipantInvite _$ParticipantInviteFromJson(Map<String, dynamic> json) {
  return ParticipantInvite(
    json['username'] as String,
    json['tripId'] as String,
    json['role'] as int,
  );
}

Map<String, dynamic> _$ParticipantInviteToJson(ParticipantInvite instance) =>
    <String, dynamic>{
      'username': instance.username,
      'tripId': instance.tripId,
      'role': instance.role,
    };
