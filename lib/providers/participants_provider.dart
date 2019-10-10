import 'dart:convert';
import 'package:blueboard/configs/api_config.dart';
import 'package:blueboard/models/participant.dart';
import 'package:blueboard/models/participantInvite.dart';
import 'package:blueboard/providers/api_client.dart';

class ParticipantsProvider {
	var _apiClient = ApiClient.instance;

  Future search(String searchValue) async {
    var parameters = {'query': searchValue};
		var response = await _apiClient.get(ApiConfig.participantsSearchUrl, parameters: parameters);
		return List<Participant>.from(response.data.map((i) => Participant.fromJson(i)));
	}

  Future invite(ParticipantInvite participant) async {
		await _apiClient.post(ApiConfig.participantsInviteUrl, json.encode(participant.toJson()));
	}

  Future delete(String id) async {
		await _apiClient.delete(ApiConfig.participantsUrl, id);
	}
}
