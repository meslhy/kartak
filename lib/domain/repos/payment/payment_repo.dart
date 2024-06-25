

import 'package:dartz/dartz.dart';
import 'package:graduation_project/data/model/failures.dart';
import 'package:graduation_project/data/model/responses/payment/PaymentResponse.dart';


abstract class PaymentRepo{

  Future<Either<Failuer,PaymentResponse>> paymentOnline(String token , String discountCode , String owner , int totalPrice);

}