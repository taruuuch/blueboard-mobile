import 'dart:convert';
import 'package:blueboard/configs/api_config.dart';
import 'package:blueboard/models/token.dart';
import 'package:blueboard/models/user.dart';
import 'package:blueboard/providers/api_client.dart';
import 'package:blueboard/providers/token_provider.dart';

class UserProvider {
  var _tokenProvider = TokenProvider();
	var _apiClient = ApiClient.instance;

  Future signIn(email, password) async {
    var data = {'email': email, 'password': password};

    var response = await _apiClient.post(ApiConfig.signInUrl, data);
    _tokenProvider.setToken(Token.fromJson(response.data));
  }

  Future signUp(email, password) async {
    var data = {'email': email, 'password': password};

    var response = await _apiClient.post(ApiConfig.signUpUrl, data);
    _tokenProvider.setToken(Token.fromJson(response.data));
  }

  Future initialUpdate(firstName, lastName) async {
    var data = {'firstName': firstName, 'lastName': lastName};

    await _apiClient.put(ApiConfig.userSetupUrl, data);
  }

  Future update(User user) async {
    await _apiClient.put(ApiConfig.userUrl, json.encode(user.toJson()));
  }

  Future get() async {
    var response = await _apiClient.get(ApiConfig.userUrl);
		return User.fromJson(response.data);
  }
}
