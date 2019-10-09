import 'package:json_annotation/json_annotation.dart';

part 'createTrip.g.dart';

@JsonSerializable()
class CreateTrip {
  CreateTrip(
		this.name,
		this.description,
		this.startDate,
		this.endDate,
		this.countries,
	);

  String name;
  String description;
  String startDate;
  String endDate;
  List<String> countries;

  factory CreateTrip.fromJson(Map<String, dynamic> json) => _$CreateTripFromJson(json);

  Map<String, dynamic> toJson() => _$CreateTripToJson(this);
}