import 'dart:convert';

import 'package:blueboard/configs/api_config.dart';
import 'package:blueboard/models/token.dart';
import 'package:blueboard/models/user.dart';
import 'package:blueboard/providers/api_client.dart';
import 'package:blueboard/providers/token_provider.dart';

class UserProvider {
  var apiClient = ApiClient();
  var tokenProvider = TokenProvider();
  User user;

  Future signIn(email, password) async {
    var data = {'email': email, 'password': password};

    var response = await apiClient.post(ApiConfig.signInUrl, data);
    tokenProvider.setToken(Token.fromJson(response.data));
  }

  Future signUp(email, password) async {
    var data = {'email': email, 'password': password};

    var response = await apiClient.post(ApiConfig.signUpUrl, data);
    tokenProvider.setToken(Token.fromJson(response.data));
  }

  Future initialUpdate(firstName, lastName) async {
    var data = {'firstName': firstName, 'lastName': lastName};

    var response = await apiClient.put(ApiConfig.userDataUrl, data);
		return User.fromJson(json.decode(response.data));
  }

  Future update(User user) async {
    var response = await apiClient.put(ApiConfig.userDataUrl, json.encode(user.toJson()));
		return response;
  }

  Future get() async {
    var response = await apiClient.get(ApiConfig.userDataUrl);
		return User.fromJson(json.decode(response.data));
  }
}
