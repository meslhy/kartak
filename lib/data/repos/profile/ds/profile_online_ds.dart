import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:graduation_project/data/model/failures.dart';
import 'package:graduation_project/data/model/responses/auth_response/AuthResponse.dart';
import 'package:graduation_project/data/model/responses/users/AllUsersResponse.dart';
import 'package:graduation_project/data/utils/shared_utils.dart';
import 'package:graduation_project/domain/repos/profile/ds/profile_online_ds.dart';
import 'package:graduation_project/ui/utils/constants.dart';
import 'package:graduation_project/ui/utils/end_points.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';


@Injectable(as: ProfileOnlineDS)
class ProfileOnlineDSImpl extends ProfileOnlineDS {




  @override
  Future<Either<Failuer, AuthResponse>> getProfile() async{

    String? token = await SharedPrefsUtils().getToken();
   try{
     Uri url = Uri.https(EndPoints.baseUrl,EndPoints.profile);



     Response serverResponse = await get(
         url,
       headers: {
           "authorization":"Bearer $token"
       }
     );

     AuthResponse response = AuthResponse.fromJson(jsonDecode(serverResponse.body));

print(response.data);
     if(serverResponse.statusCode >=200 && serverResponse.statusCode <300){
       return right(response);
     }else{
       return left(Failuer(response.message??Constants.defaultErrorMessage));
     }

   }catch(e,ee){
     print(e);
     return left(Failuer(e.toString()));
   }
  }

  @override
  Future<Either<Failuer, AllUsersResponse>> getAllUsers() async{
    try{
      Uri url = Uri.https(EndPoints.baseUrl,EndPoints.users);
      Response serverResponse = await get(url);
      AllUsersResponse response = AllUsersResponse.fromJson(jsonDecode(serverResponse.body));

      if(serverResponse.statusCode >= 200 && serverResponse.statusCode < 300){
        return right(response);
      }else{
        return left(Failuer(response.message?? Constants.defaultErrorMessage));
      }
    }catch(e,ee){
      return left(Failuer(e.toString()));
    }
  }




}