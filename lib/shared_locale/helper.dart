import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class SharedPreferenceGlobal
{
  static late  SharedPreferences sharedPreferences;


  static init()
  async{
    sharedPreferences =await SharedPreferences.getInstance();
  }

  static Future<bool> putData({required String key, required int data}) async{
    return await sharedPreferences.setInt(key, data);
  }

  static Future<bool> putDataBool({required String key, required bool value}) async{
    return await sharedPreferences.setBool(key, value);
  }

  static Future<bool> putDataString({required String key, required String value}) async{
    return await sharedPreferences.setString(key, value);
  }

   static int? getData({required String key}) {
    return  sharedPreferences.getInt(key);
  }

  static bool getDataBool({required String key}) {
    return  sharedPreferences.getBool(key) ?? false;
  }

  static String getDataString({required String key}) {
    return  sharedPreferences.getString(key) ?? "";
  }



}