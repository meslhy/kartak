import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:graduation_project/data/model/failures.dart';
import 'package:graduation_project/data/model/responses/transactions/TransactionsResponse.dart';
import 'package:graduation_project/data/utils/shared_utils.dart';
import 'package:graduation_project/domain/repos/transactions/ds/transactions_online_ds.dart';
import 'package:graduation_project/ui/utils/constants.dart';
import 'package:graduation_project/ui/utils/end_points.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';


@Injectable(as:TransactionsOnlineDS )
 class TransactionsOnlineDSImpl extends TransactionsOnlineDS{



  @override
  Future<Either<Failuer, TransactionsResponse>> getTransactions() async{
    String? token = await SharedPrefsUtils().getToken();
    try{

      Uri url = Uri.https(EndPoints.baseUrl,EndPoints.userTransactions);

      Response serverResponse = await get(
        url,
        headers: {
          "authorization":"Bearer $token"
        }
      );
      TransactionsResponse response = TransactionsResponse.fromJson(jsonDecode(serverResponse.body));

      if(serverResponse.statusCode >=200 && serverResponse.statusCode < 300){
        return right(response);
      }else{
        return left(Failuer(response.message??Constants.defaultErrorMessage));

      }

    }catch(e,ee){
      return left(Failuer(e.toString()));
    }
  }


}