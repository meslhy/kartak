import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:graduation_project/data/model/failures.dart';
import 'package:graduation_project/data/model/responses/transactions/TransactionsResponse.dart';
import 'package:graduation_project/ui/utils/base_request_states.dart';
import 'package:injectable/injectable.dart';

import '../repos/transactions/transactions_repo.dart';


@injectable
class GetTransactionsUseCase extends Cubit{

  TransactionsRepo repo;


  GetTransactionsUseCase(this.repo):super(BaseRequestInitialState());

  execute(String token)async{

    Either either =await repo.getTransactions(token);

    either.fold(
            (failure) => emit(BaseRequestErrorState(failure.errorMessage)),
            (data) => emit(BaseRequestSuccessState<List<TransactionData>>(data: data.data))
    );


  }



}