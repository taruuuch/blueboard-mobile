import 'dart:convert';
import 'package:blueboard/configs/api_config.dart';
import 'package:blueboard/providers/api_client.dart';

class TripsProvider {
	var _apiClient = ApiClient.instance;

	Future get() async {
		var response = await _apiClient.get(ApiConfig.tripUrl);
		return response.data;
	}

	Future add() async {

	}

	Future update() async {
		
	}

	Future delete() async {

	}
}