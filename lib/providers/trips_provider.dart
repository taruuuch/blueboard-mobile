import 'dart:convert';
import 'package:blueboard/configs/api_config.dart';
import 'package:blueboard/models/country.dart';
import 'package:blueboard/models/createTrip.dart';
import 'package:blueboard/models/trip.dart';
import 'package:blueboard/models/tripParticipant.dart';
import 'package:blueboard/models/tripSlim.dart';
import 'package:blueboard/providers/api_client.dart';

class TripsProvider {
	var _apiClient = ApiClient.instance;

	// getAll - return all user trips
	Future getAll() async {
		var response = await _apiClient.get(ApiConfig.tripUrl);
		return List<TripSlim>.from(response.data.map((i) => TripSlim.fromJson(i)));
	}

	Future add(CreateTrip trip) async {
		var response = await _apiClient.post(ApiConfig.tripUrl, json.encode(trip.toJson()));
    return response.data;
	}

	Future update(Trip trip) async {
		await _apiClient.put(ApiConfig.tripUrl, json.encode(trip.toJson()));
	}

	// Get and delete single trip by ID
	Future get(id) async {
		var response = await _apiClient.get(ApiConfig.tripUrl + '/' + id);
		return Trip.fromJson(response.data);
	}

	Future delete(id) async {
		await _apiClient.delete(ApiConfig.tripUrl, id);
	}

	// Search trips
	Future search({String searchValue, DateTime fromDate, DateTime toDate}) async {
    Map<String, dynamic> parameters = {};

    if (searchValue != "") parameters['query'] = searchValue;
    if (fromDate != null) parameters['fromDate'] = fromDate.toString();
    if (toDate != null) parameters['toDate'] = toDate.toString();

		var response = await _apiClient.get(ApiConfig.tripSearchUrl, parameters: parameters);
		return List<TripSlim>.from(response.data.map((i) => TripSlim.fromJson(i)));
	}

  Future countries() async {
    var response = await _apiClient.get(ApiConfig.countriesUrl);
    return List<Country>.from(response.data.map((i) => Country.fromJson(i)));
  }

  Future participants(id) async {
    String participantsUrl = ApiConfig.tripUrl + '/' + id + '/participants';
    var response = await _apiClient.get(participantsUrl);
    return List<TripParticipant>.from(response.data.map((i) => TripParticipant.fromJson(i)));
  }
}
