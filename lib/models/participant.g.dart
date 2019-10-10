// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'participant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Participant _$ParticipantFromJson(Map<String, dynamic> json) {
  return Participant(
    json['firstName'] as String,
    json['lastName'] as String,
    json['username'] as String,
    json['avatar'] as String,
  );
}

Map<String, dynamic> _$ParticipantToJson(Participant instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'username': instance.username,
      'avatar': instance.avatar,
    };
