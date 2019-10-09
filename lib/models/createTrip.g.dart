// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'createTrip.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateTrip _$CreateTripFromJson(Map<String, dynamic> json) {
  return CreateTrip(
    json['name'] as String,
    json['description'] as String,
    json['startDate'] as String,
    json['endDate'] as String,
    (json['countries'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$CreateTripToJson(CreateTrip instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'countries': instance.countries,
    };
