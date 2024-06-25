

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:graduation_project/data/model/failures.dart';
import 'package:graduation_project/data/model/responses/payment/PaymentResponse.dart';
import 'package:graduation_project/domain/repos/payment/ds/payment_online_ds.dart';
import 'package:graduation_project/ui/utils/constants.dart';
import 'package:graduation_project/ui/utils/end_points.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';


@Injectable(as:PaymentOnlineDS )
class PaymentOnlineDSImpl extends  PaymentOnlineDS{


  @override
  Future<Either<Failuer, PaymentResponse>> paymentOnline(String token , String discountCode , String owner , int totalPrice) async{

    final url = Uri.parse('https://${EndPoints.baseUrl}${EndPoints.payment}');
    final headers = {
      'authorization': 'Bearer $token',
    };
    final body = json.encode({
      "code":discountCode,
      "totalPrice":totalPrice,
      "owner":owner
    });
  try{
    var client = Client();
    var request = Request('GET', url)
      ..headers.addAll(headers)
      ..body = body;



    var streamedResponse = await client.send(request);
    Response serverResponse = await Response.fromStream(streamedResponse);


    PaymentResponse response = PaymentResponse.fromJson(jsonDecode(serverResponse.body));


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

}