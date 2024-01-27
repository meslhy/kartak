import 'dart:convert';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:graduation_project/data/model/responses/loginResponse.dart';
import 'package:graduation_project/ui/utils/end_points.dart';
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/repos/auth_repo/auth_repo.dart';
import '../../../ui/utils/constants.dart';
import '../../model/failures.dart';
import '../../utils/shared_utils.dart';

@Injectable(as: AuthRepo )
class AuthRepoImpl extends AuthRepo {



  SharedPrefsUtils sharedPrefsUtils;
  Connectivity connectivity;
  AuthRepoImpl(this.connectivity , this.sharedPrefsUtils);

  @override
  Future<Either<Failuer,bool>> login(String email , String pass) async{
    final body = jsonEncode({
      "email": email,
      "password": pass,});

    final connectivityResult = await (connectivity.checkConnectivity());

    if(connectivityResult ==ConnectivityResult.wifi ||connectivityResult ==ConnectivityResult.mobile) {
      try{
      Uri url = Uri.https(EndPoints.baseUrl,EndPoints.login);

      Response serverResponse = await post(
          url,
          headers: {

            "Content-Type": "application/json",
          },
          body: body
      );

      print("$email \n $pass");
      print(serverResponse.body);


      LoginResponse authResponse = LoginResponse.fromJson(
          jsonDecode(serverResponse.body));

            if (serverResponse.statusCode >= 200 &&
          serverResponse.statusCode < 300) {
        sharedPrefsUtils.saveUser(authResponse.data!.userData!);
        sharedPrefsUtils.saveToken(authResponse.data!.token!);
        //print(await sharedPrefsUtils.getToken());
        return const Right(true);
      } else {

        return left(Failuer(authResponse.message??Constants.defaultErrorMessage));

      }
    }catch(e,ee){
        print(e);
        print(ee);
        return left(Failuer(Constants.defaultErrorMessage));
      }
      } else {
      return Left(Failuer(Constants.internetErrorMessage));
    }

  }








  @override
  Future<Either<Failuer, bool>> register({
    required firstName,
    required lastName,
    required password,
    required email,
    required avatar
}) async {
    final connectivityResult = await (connectivity.checkConnectivity());
    if(connectivityResult ==ConnectivityResult.wifi ||connectivityResult ==ConnectivityResult.mobile){
      try {
        var formData = MultipartRequest('POST', Uri.parse("https://kartak-demo-m6vj.onrender.com/api/users/register"));
        formData.fields.addAll({
          'firstName': firstName,
          'lastName': lastName,
          'password': password,
          'email': email,
          'role': 'USER',
        });

        formData.files.add( MultipartFile(
          'avatar',
          avatar!.readAsBytes().asStream(),
          avatar.lengthSync(),
          filename: avatar.path.split("/").last,
          contentType: MediaType('image', 'png'),
        ));

        print(formData.fields);

        Response serverResponse = await Response.fromStream(await formData.send());
        // Response serverResponse = await post(url, body: {
        //   "firstName": body.firstName,
        //   "lastName": body.lastName,
        //   "password": "123456",
        //   "email": body.email,
        //   "role": "USER",
        //   "avatar": ""
        // });
        print(serverResponse.statusCode);
        LoginResponse authResponse = LoginResponse.fromJson(
            jsonDecode(serverResponse.body));
        if (serverResponse.statusCode >= 200 &&
            serverResponse.statusCode < 300) {
          sharedPrefsUtils.saveUser(authResponse.data!.userData!);
          sharedPrefsUtils.saveToken(authResponse.data!.token!);
          return const Right(true);
        } else {
          print(authResponse.message);
          return left(Failuer(authResponse.message ?? Constants.defaultErrorMessage));
        }
      }catch(e,ee){
        return left(Failuer(Constants.defaultErrorMessage));
      }
    }else{
      return Left(Failuer(Constants.internetErrorMessage));
    }
  }






}