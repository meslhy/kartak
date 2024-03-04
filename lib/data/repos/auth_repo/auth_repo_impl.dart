import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:graduation_project/data/model/responses/auth_responses/auth_response.dart';
import 'package:graduation_project/data/model/responses/auth_responses/errors.dart';
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


      AuthResponse authResponse = AuthResponse.fromJson(
          jsonDecode(serverResponse.body));

            if (serverResponse.statusCode >= 200 &&
          serverResponse.statusCode < 300) {
        sharedPrefsUtils.saveUser(authResponse);
        sharedPrefsUtils.saveToken(authResponse.token!);
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
    required String name,
    required String password,
    required String passwordConfirm,
    required String email,
}) async {

    final body = jsonEncode({
      "name":name,
      "email":email,
      "password":password,
      "passwordConfirm":passwordConfirm,
    });

    final connectivityResult = await (connectivity.checkConnectivity());
    if(connectivityResult ==ConnectivityResult.wifi ||connectivityResult ==ConnectivityResult.mobile){
      try {
        Uri url = Uri.https(EndPoints.baseUrl,EndPoints.register);

        Response serverResponse = await post(
            url,
            headers: {
              "Content-Type": "application/json",
            },
            body: body
        );

        AuthResponse response = AuthResponse.fromJson(jsonDecode(serverResponse.body));
        Errors responseError = Errors.fromJson(jsonDecode(serverResponse.body));

        print(serverResponse.statusCode);
        if (serverResponse.statusCode >= 200 &&
            serverResponse.statusCode < 300) {

          sharedPrefsUtils.saveUser(response);
          sharedPrefsUtils.saveToken(response.token!);
          return const Right(true);
        } else {
          print(responseError.errors![0].msg);
          return left(Failuer(responseError.errors![0].msg ?? Constants.defaultErrorMessage));
        }
      }catch(e,ee){
        print("$e,$ee");
        return left(Failuer(Constants.defaultErrorMessage));
      }
    }else{
      return Left(Failuer(Constants.internetErrorMessage));
    }
  }






}