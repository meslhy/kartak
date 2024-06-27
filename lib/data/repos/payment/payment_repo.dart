

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:graduation_project/data/model/failures.dart';
import 'package:graduation_project/data/model/responses/payment/PaymentResponse.dart';
import 'package:graduation_project/domain/repos/payment/ds/payment_online_ds.dart';
import 'package:graduation_project/domain/repos/payment/payment_repo.dart';
import 'package:graduation_project/ui/utils/constants.dart';
import 'package:graduation_project/ui/utils/extensions.dart';
import 'package:injectable/injectable.dart';


@Injectable(as:PaymentRepo )
class PaymentRepoImpl extends PaymentRepo{

  PaymentOnlineDS paymentOnlineDS;
  Connectivity connectivity;
  PaymentRepoImpl(this.paymentOnlineDS,this.connectivity);

  @override
  Future<Either<Failuer, PaymentResponse>> paymentOnline(String token, String discountCode, String owner, String totalPrice) async{
    if(await connectivity.isInternetConnective){
      return paymentOnlineDS.paymentOnline(token, discountCode, owner, totalPrice);
    }else{
      return left(Failuer(Constants.internetErrorMessage));
    }
  }

  @override
  Future<Either<Failuer, PaymentResponse>> paymentCash(String discountCode, String owner, String totalPrice) async{
    if(await connectivity.isInternetConnective){
      return paymentOnlineDS.paymentCash(discountCode, owner, totalPrice);
    }else{
      return left(Failuer(Constants.internetErrorMessage));
    }
  }





}