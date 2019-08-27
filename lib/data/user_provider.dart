import 'package:blueboard/data/api_config.dart';
import 'package:blueboard/data/api_client.dart';

class UserProvider {
  var apiClient = ApiClient();

  var token;

  Future signIn(email, password) async {
    var data = {
      'email': email,
      'password': password
    };

    try {
      token = await apiClient.post(ApiConfig.signInUrl, data);
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
      token = await apiClient.post(ApiConfig.signUpUrl, data);
    } catch (e) {
      print(e);
    }  
  }
}