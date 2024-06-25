import 'package:bloc/bloc.dart';
import 'package:graduation_project/domain/use_cases/get_transactions_use_case.dart';
import 'package:graduation_project/ui/utils/base_request_states.dart';
import 'package:injectable/injectable.dart';


@injectable
class TransactionsViewModel extends Cubit{

  GetTransactionsUseCase getTransactionsUseCase;

  TransactionsViewModel(this.getTransactionsUseCase):super(BaseRequestInitialState());


  getTransactions(String token){
    return getTransactionsUseCase.execute(token);
  }


}