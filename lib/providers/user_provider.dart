import 'package:blueboard/configs/api_config.dart';
import 'package:blueboard/providers/api_client.dart';
import 'package:blueboard/providers/token_provider.dart';

class UserProvider {
  var apiClient = ApiClient();
  var tokenProvider = TokenProvider();

  Future signIn(email, password) async {
    var data = {
      'email': email,
      'password': password
    };

    try {
      var token = await apiClient.post(ApiConfig.signInUrl, data);
      tokenProvider.setToken(token);
    } catch (e) {
      print(e);
    }
  }

  Future signUp(email, password) async {
    var data = {
      'email': email,
      'password': password
    };

    try {
      var token = await apiClient.post(ApiConfig.signUpUrl, data);
      tokenProvider.setToken(token);
    } catch (e) {
      print(e);
    }  
  }
}