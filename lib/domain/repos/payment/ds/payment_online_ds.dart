import 'package:dartz/dartz.dart';
import 'package:graduation_project/data/model/failures.dart';
import 'package:graduation_project/data/model/responses/payment/paymentOnlineResponse.dart';

import '../../../../data/model/responses/payment/PaymentResponse.dart';

abstract class PaymentOnlineDS{

  Future<Either<Failuer,PaymentOnlineResponse>> paymentOnline( String discountCode , String owner , String totalPrice);
  Future<Either<Failuer,PaymentResponse>> paymentCash( String discountCode , String owner , String totalPrice);

}