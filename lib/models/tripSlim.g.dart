// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tripSlim.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TripSlim _$TripSlimFromJson(Map<String, dynamic> json) {
  return TripSlim(
    json['name'] as String,
    json['description'] as String,
    json['startDate'] as String,
    json['endDate'] as String,
    json['countries'] as String,
    json['id'] as String,
  );
}

Map<String, dynamic> _$TripSlimToJson(TripSlim instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'countries': instance.countries,
    };
