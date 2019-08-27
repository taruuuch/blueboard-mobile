import 'package:blueboard/data/config.dart';
import 'package:blueboard/data/api_client.dart';

class UserProvider {
  var config = Config();
  var apiClient = ApiClient();

  signInUser(email, password) async {
    var data = {
      'email': email,
      'password': password
    };

    apiClient.apiPost(config.signIn, data);
  }

  signUpUser(email, password) async {
    var data = {
      'email': email,
      'password': password
    };

    apiClient.apiPost(config.signUp, data);
  }
}