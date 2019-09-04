// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    json['id'] as String,
    json['firstName'] as String,
    json['lastName'] as String,
    json['status'] as String,
    json['email'] as String,
    json['phone'] as String,
    json['password'] as String,
    json['avatar'] == null ? null : Uri.parse(json['avatar'] as String),
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'phone': instance.phone,
      'password': instance.password,
      'status': instance.status,
      'avatar': instance.avatar?.toString(),
    };
