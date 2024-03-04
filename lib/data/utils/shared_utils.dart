import 'dart:convert';
import 'package:graduation_project/data/model/responses/auth_responses/auth_response.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class SharedPrefsUtils {


  saveUser(AuthResponse user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("user", jsonEncode(user.toJson()));
  }

  saveToken(String token)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", token);

  }

  Future<AuthResponse?> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userAsString = prefs.getString("user");
    if (userAsString == null) return null;
    return AuthResponse.fromJson(jsonDecode(userAsString));
  }

  Future<String?> getToken()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("token");
  }
}