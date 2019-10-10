// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tripParticipant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TripParticipant _$TripParticipantFromJson(Map<String, dynamic> json) {
  return TripParticipant(
    json['id'] as String,
    json['firstName'] as String,
    json['lastName'] as String,
    json['role'] as String,
  );
}

Map<String, dynamic> _$TripParticipantToJson(TripParticipant instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'role': instance.role,
    };
