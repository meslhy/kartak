

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:graduation_project/data/model/failures.dart';
import 'package:graduation_project/data/model/responses/payment/PaymentResponse.dart';
import 'package:graduation_project/data/model/responses/payment/paymentOnlineResponse.dart';
import 'package:graduation_project/data/utils/shared_utils.dart';
import 'package:graduation_project/domain/repos/payment/ds/payment_online_ds.dart';
import 'package:graduation_project/ui/utils/constants.dart';
import 'package:graduation_project/ui/utils/end_points.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';


@Injectable(as:PaymentOnlineDS )
class PaymentOnlineDSImpl extends  PaymentOnlineDS{


  @override
  Future<Either<Failuer, PaymentOnlineResponse>> paymentOnline( String discountCode , String owner , String totalPrice) async{

    String token = await SharedPrefsUtils().getToken()??"";

    final url = Uri.parse('https://${EndPoints.baseUrl}${EndPoints.onlinePayment}');
    final headers = {
      'authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };
    final body = json.encode({
      "code":discountCode,
      "totalPrice":totalPrice,
      "owner":owner
    });
  try{

    Response serverResponse = await post(
        url,
      headers: headers,
      body: body
    );


    PaymentOnlineResponse response = PaymentOnlineResponse.fromJson(jsonDecode(serverResponse.body));


    print("result is 000000 : ${serverResponse.body}");
    if(serverResponse.statusCode >= 200 && serverResponse.statusCode < 300){
      print(response.data?.url??"don't found ...");
      return right(response);

    }else{
      print("payment erroe ${Failuer(response.message?? Constants.defaultErrorMessage).errorMessage}");
      return left(Failuer(response.message?? Constants.defaultErrorMessage));
    }

  }catch(e,ee){
    print("Error is $e in $ee");
    return left(Failuer(e.toString()));
  }
  }

  @override
  Future<Either<Failuer, PaymentResponse>> paymentCash(String discountCode, String owner, String totalPrice) async{
    String token = await SharedPrefsUtils().getToken()??"";
    
    try{

      print("$discountCode,,,,$owner,,,,,$totalPrice,,,,,,$token");
      Uri url = Uri.parse("https://${EndPoints.baseUrl}${EndPoints.cashPayment}");

      Response serverResponse = await post(
          url,
        headers: {
          'Content-Type': 'application/json',
          "authorization":"Bearer $token",
        },
        body:  jsonEncode({
          'code': discountCode,
          'totalPrice': totalPrice,
          'owner': owner,
        })
      );

      PaymentResponse response = PaymentResponse.fromJson(jsonDecode(serverResponse.body));

      print(serverResponse.statusCode);
      if(serverResponse.statusCode >=200 && serverResponse.statusCode< 300){
        return right(response);
      }else{
        return left(Failuer(response.message??Constants.defaultErrorMessage));
      }
    }catch(e,ee){
      print("error in paymentCash is $e in $ee");
      return left(Failuer(e.toString()));
    }

  }

}