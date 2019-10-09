import 'package:blueboard/models/country.dart';
import 'package:json_annotation/json_annotation.dart';

part 'trip.g.dart';

@JsonSerializable()
class Trip {
  Trip(
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
  List<Country> countries;

  factory Trip.fromJson(Map<String, dynamic> json) => _$TripFromJson(json);

  Map<String, dynamic> toJson() => _$TripToJson(this);
}