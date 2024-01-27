import 'dart:convert';

import 'package:graduation_project/data/model/responses/loginResponse.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class SharedPrefsUtils {

  saveUser(UserData user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("user", jsonEncode(user.toJson()));
  }

  saveToken(String token)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", token);

  }

  Future<UserData?> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userAsString = prefs.getString("user");
    if (userAsString == null) return null;
    return UserData.fromJson(jsonDecode(userAsString));
  }

  Future<String?> getToken()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("token");
  }
}