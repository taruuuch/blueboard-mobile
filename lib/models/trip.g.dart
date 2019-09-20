// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Trip _$TripFromJson(Map<String, dynamic> json) {
  return Trip(
    json['name'] as String,
    json['description'] as String,
    json['startDate'] as String,
    json['endDate'] as String,
    json['countries'] as String,
    json['id'] as String,
  );
}

Map<String, dynamic> _$TripToJson(Trip instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'countries': instance.countries,
    };
