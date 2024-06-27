import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:graduation_project/data/model/failures.dart';
import 'package:graduation_project/data/model/responses/transactions/TransactionsResponse.dart';
import 'package:graduation_project/domain/repos/transactions/ds/transactions_online_ds.dart';
import 'package:graduation_project/domain/repos/transactions/transactions_repo.dart';
import 'package:graduation_project/ui/utils/constants.dart';
import 'package:graduation_project/ui/utils/extensions.dart';
import 'package:injectable/injectable.dart';


@Injectable(as: TransactionsRepo)
class TransactionsRepoImpl extends TransactionsRepo{

  TransactionsOnlineDS transactionsOnlineDS;
  Connectivity connectivity;

  TransactionsRepoImpl(this.connectivity,this.transactionsOnlineDS);


  @override
  Future<Either<Failuer, TransactionsResponse>> getTransactions() async{
    if(await connectivity.isInternetConnective){
      return transactionsOnlineDS.getTransactions();
    }else{
      return left(Failuer(Constants.internetErrorMessage));
    }
  }


}