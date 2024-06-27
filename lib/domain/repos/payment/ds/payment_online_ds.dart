import 'package:dartz/dartz.dart';
import 'package:graduation_project/data/model/failures.dart';

import '../../../../data/model/responses/payment/PaymentResponse.dart';

abstract class PaymentOnlineDS{

  Future<Either<Failuer,PaymentResponse>> paymentOnline(String token , String discountCode , String owner , String totalPrice);
  Future<Either<Failuer,PaymentResponse>> paymentCash( String discountCode , String owner , String totalPrice);

}