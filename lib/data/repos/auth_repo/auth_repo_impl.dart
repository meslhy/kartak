import 'dart:convert';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:graduation_project/data/model/responses/auth_response/auth_response.dart';
import 'package:graduation_project/ui/utils/end_points.dart';
import 'package:graduation_project/ui/utils/extensions.dart';
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
    required String phone,
    required String email,
    required File image
}) async {

    final connectivityResult = await (connectivity.checkConnectivity());
    if(connectivityResult ==ConnectivityResult.wifi ||connectivityResult ==ConnectivityResult.mobile){
      try {
        var formData = MultipartRequest('POST', Uri.parse("https://kartak.onrender.com/api/user"));
        formData.fields.addAll({
          'name': name,
          'email': email,
          'phone': phone,
          'password': password,
          'confirmPassword': passwordConfirm,
        });

        formData.files.add( MultipartFile(
          'profileImage',
          image.readAsBytes().asStream(),
          image.lengthSync(),
          filename: image.path.split("/").last,
          contentType: MediaType('image', 'png'),
        ));

        print(formData.fields);

        Response serverResponse = await Response.fromStream(await formData.send());
        AuthResponse response = AuthResponse.fromJson(
            jsonDecode(serverResponse.body));
        if (serverResponse.statusCode >= 200 &&
            serverResponse.statusCode < 300) {

          sharedPrefsUtils.saveUser(response);
          print("token is : ${response.message}");
          sharedPrefsUtils.saveToken(response.token!);
          return const Right(true);
        } else {
          print(response.message);
          return left(Failuer(response.message ?? Constants.defaultErrorMessage));
        }
      }catch(e,ee){
        print("$e,$ee");
        return left(Failuer(Constants.defaultErrorMessage));
      }
    }else{
      return Left(Failuer(Constants.internetErrorMessage));
    }
  }



  @override
  Future<Either<Failuer, bool>> sendOTP(String email) async{
    final body = jsonEncode({
      "email": email,});

    if(await connectivity.isInternetConnective) {
      try{
        Uri url = Uri.https(EndPoints.baseUrl,EndPoints.sendOTP);

        Response serverResponse = await post(
            url,
            headers: {
              "Content-Type": "application/json",
            },
            body: body
        );



        AuthResponse authResponse = AuthResponse.fromJson(
            jsonDecode(serverResponse.body));

        if (serverResponse.statusCode >= 200 &&
            serverResponse.statusCode < 300) {
          return const Right(true);
        } else {

          return left(Failuer(authResponse.message??Constants.defaultErrorMessage));

        }
      }catch(e,ee){
        print(ee);
        return left(Failuer(e.toString()));
      }
    } else {
      return Left(Failuer(Constants.internetErrorMessage));
    }
  }



  @override
  Future<Either<Failuer, bool>> verificationOTP(String otp) async{
    final body = jsonEncode({
      "resetCode": otp,});

    if(await connectivity.isInternetConnective) {
      try{
        Uri url = Uri.https(EndPoints.baseUrl,EndPoints.verificationOTP);

        Response serverResponse = await post(
            url,
            headers: {
              "Content-Type": "application/json",
            },
            body: body
        );


        if (serverResponse.statusCode >= 200 &&
            serverResponse.statusCode < 300) {
          return const Right(true);
        } else {
          print(serverResponse.body);
          return left(Failuer(Constants.defaultErrorMessage));

        }
      }catch(e,ee){
        print("erorr is $e ,,,,$ee");
        return left(Failuer(e.toString()));
      }
    } else {
      return Left(Failuer(Constants.internetErrorMessage));
    }
  }





}