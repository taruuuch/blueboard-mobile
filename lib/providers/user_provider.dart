import 'dart:convert';
import 'package:blueboard/configs/api_config.dart';
import 'package:blueboard/models/token.dart';
import 'package:blueboard/models/user.dart';
import 'package:blueboard/providers/api_client.dart';
import 'package:blueboard/providers/token_provider.dart';

class UserProvider {
  var tokenProvider = TokenProvider();

  Future signIn(email, password) async {
    var data = {'email': email, 'password': password};

    var response = await ApiClient.instance.post(ApiConfig.signInUrl, data);
    tokenProvider.setToken(Token.fromJson(response.data));
  }

  Future signUp(email, password) async {
    var data = {'email': email, 'password': password};

    var response = await ApiClient.instance.post(ApiConfig.signUpUrl, data);
    tokenProvider.setToken(Token.fromJson(response.data));
  }

  Future initialUpdate(firstName, lastName) async {
    var data = {'firstName': firstName, 'lastName': lastName};

    await ApiClient.instance.put(ApiConfig.userSetupUrl, data);
  }

  Future update(User user) async {
    await ApiClient.instance.put(ApiConfig.userUrl, json.encode(user.toJson()));
  }

  Future get() async {
    var response = await ApiClient.instance.get(ApiConfig.userUrl);
		return User.fromJson(response.data);
  }
}
