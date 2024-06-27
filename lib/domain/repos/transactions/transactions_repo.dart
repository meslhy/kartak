import 'package:dartz/dartz.dart';
import 'package:graduation_project/data/model/failures.dart';
import 'package:graduation_project/data/model/responses/transactions/TransactionsResponse.dart';

abstract class TransactionsRepo{

  Future<Either<Failuer, TransactionsResponse>> getTransactions();
}