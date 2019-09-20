import 'package:json_annotation/json_annotation.dart';

part 'trip.g.dart';

@JsonSerializable()
class Trip {
  Trip(
		this.id,
		this.name, 
		this.description, 
		this.startDate, 
		this.endDate, 
		this.countries, 
	);

  String id;
  String name;
  String description;
  String startDate;
  String endDate;
  String countries;

  factory Trip.fromJson(Map<String, dynamic> json) => _$TripFromJson(json);

  Map<String, dynamic> toJson() => _$TripToJson(this);
}