import 'package:blueboard/models/token.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class TokenProvider {
  SharedPreferences prefs;

  setToken(Token token) async {
    prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', json.encode(token.toJson()));
  }

  getToken() async {
    prefs = await SharedPreferences.getInstance();
    String tokenString = prefs.getString('token');
    if (tokenString != null) return Token.fromJson(json.decode(tokenString));
    return null;
  }
}
