import 'package:json_annotation/json_annotation.dart';

part 'tripSlim.g.dart';

@JsonSerializable()
class TripSlim {
  TripSlim(
		this.name, 
		this.description, 
		this.startDate, 
		this.endDate, 
		this.countries, 
		this.id,
	);

  String id;
  String name;
  String description;
  String startDate;
  String endDate;
  String countries;

  factory TripSlim.fromJson(Map<String, dynamic> json) => _$TripSlimFromJson(json);

  Map<String, dynamic> toJson() => _$TripSlimToJson(this);
}