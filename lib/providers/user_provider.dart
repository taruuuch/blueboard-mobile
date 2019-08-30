import 'package:blueboard/configs/api_config.dart';
import 'package:blueboard/models/token.dart';
import 'package:blueboard/providers/api_client.dart';
import 'package:blueboard/providers/token_provider.dart';

class UserProvider {
  var apiClient = ApiClient();
  var tokenProvider = TokenProvider();

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
}
