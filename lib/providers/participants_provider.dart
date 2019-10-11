import 'dart:convert';
import 'package:blueboard/configs/api_config.dart';
import 'package:blueboard/models/participantInvite.dart';
import 'package:blueboard/models/tripParticipant.dart';
import 'package:blueboard/providers/api_client.dart';

class ParticipantsProvider {
	var _apiClient = ApiClient.instance;

  Future search(String searchValue) async {
    var parameters = {'query': searchValue};
		var response = await _apiClient.get(ApiConfig.participantsSearchUrl, parameters: parameters);
		return List<TripParticipant>.from(response.data.map((i) => TripParticipant.fromJson(i)));
	}

  Future invite(ParticipantInvite participant) async {
		await _apiClient.post(ApiConfig.participantsInviteUrl, json.encode(participant.toJson()));
	}

  Future delete(String id) async {
		await _apiClient.delete(ApiConfig.participantsUrl, id);
	}
}
