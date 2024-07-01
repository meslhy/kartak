import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:graduation_project/data/model/failures.dart';
import 'package:graduation_project/data/model/responses/auth_response/AuthResponse.dart';
import 'package:graduation_project/data/model/responses/profile/add_place/AddPlaceResponse.dart';
import 'package:graduation_project/data/model/responses/users/AllUsersResponse.dart';
import 'package:graduation_project/data/utils/shared_utils.dart';
import 'package:graduation_project/domain/repos/profile/ds/profile_online_ds.dart';
import 'package:graduation_project/ui/utils/constants.dart';
import 'package:graduation_project/ui/utils/end_points.dart';
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'package:injectable/injectable.dart';


@Injectable(as: ProfileOnlineDS)
class ProfileOnlineDSImpl extends ProfileOnlineDS {

  SharedPrefsUtils sharedPrefsUtils;

  ProfileOnlineDSImpl(this.sharedPrefsUtils);

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
       sharedPrefsUtils.saveUser(response);
       print("token is : ${response.message}");
       sharedPrefsUtils.saveToken(response.token!);
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

  @override
  Future<Either<Failuer, AuthResponse>> getSpecificUsers(String id) async{
    try{
      Uri url = Uri.parse("https://${EndPoints.baseUrl}${EndPoints.users}/$id");
      Response serverResponse = await get(url);
      AuthResponse response = AuthResponse.fromJson(jsonDecode(serverResponse.body));

      print(serverResponse.body);

      if(serverResponse.statusCode >= 200 && serverResponse.statusCode < 300){
        return right(response);
      }else{
        return left(Failuer(response.message?? Constants.defaultErrorMessage));
      }
    }catch(e,ee){
      return left(Failuer(e.toString()));
    }
  }

  @override
  Future<Either<Failuer,bool>> updatePhoto( File image) async{

    String token = await SharedPrefsUtils().getToken()??"";
    try {
      var formData = MultipartRequest('POST', Uri.parse("https://${EndPoints.baseUrl}${EndPoints.updatePhoto}"));


      formData.headers.addAll(
        {
          'authorization': 'Bearer $token',
          'Content-Type': 'multipart/form-data',
        }
      );


      formData.files.add( MultipartFile(
        'profileImage',
        image.readAsBytes().asStream(),
        image.lengthSync(),
        filename: image.path.split("/").last,
        contentType: MediaType('image', 'png'),
      ));


      Response serverResponse = await Response.fromStream(await formData.send());

      print(" body of update profile is ::: ${serverResponse.body}");
      if (serverResponse.statusCode >= 200 &&
          serverResponse.statusCode < 300) {
        return const Right(true);
      } else {
        return left(Failuer( Constants.defaultErrorMessage));
      }
    }catch(e,ee){
      print("$e,$ee");
      return left(Failuer(Constants.defaultErrorMessage));
    }
  }

  @override
  Future<Either<Failuer, bool>> addPlace(String name, String description, String discount, File imageCover, String category,String owner,String code) async{
   try{
     var formData = MultipartRequest('POST', Uri.parse("https://${EndPoints.baseUrl}${EndPoints.places}}"));
     formData.fields.addAll({
       'name': name,
       'description': description,
       'discount': discount,
       // 'imageCover': imageCover,
       'category': category,
       'owner': owner,
       'code': code,
     });

     formData.files.add( MultipartFile(
       'imageCover',
       imageCover.readAsBytes().asStream(),
       imageCover.lengthSync(),
       filename: imageCover.path.split("/").last,
       contentType: MediaType('image', 'png'),
     ));

     print(" file is ::: ${formData.fields}");

     Response serverResponse = await Response.fromStream(await formData.send());

     AddPlaceResponse response = AddPlaceResponse.fromJson(jsonDecode(serverResponse.body));

     if(serverResponse.statusCode >=200 && serverResponse.statusCode < 300 ){
       return right(true);
     }else{
       return left(Failuer(response.message??Constants.defaultErrorMessage));
     }
   }catch(e,ee){
     return left(Failuer(e.toString()));
   }
  }




}