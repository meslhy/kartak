import 'package:bloc/bloc.dart';
import 'package:graduation_project/data/model/responses/auth_response/AuthResponse.dart';
import 'package:graduation_project/data/utils/shared_utils.dart';
import 'package:graduation_project/domain/use_cases/get_profile_use_case.dart';
import 'package:graduation_project/domain/use_cases/get_transactions_use_case.dart';
import 'package:graduation_project/ui/screens/main/tabs/home/home_view_model.dart';
import 'package:graduation_project/ui/utils/base_request_states.dart';
import 'package:injectable/injectable.dart';


@injectable
class TransactionsViewModel extends Cubit{

  GetTransactionsUseCase getTransactionsUseCase;
  GetProfileUseCase getProfileUseCase;
  AuthResponse? currentUser;


  TransactionsViewModel(this.getTransactionsUseCase,this.getProfileUseCase):super(BaseRequestInitialState());


  getUser()async{
    currentUser = await SharedPrefsUtils().getUser();
    emit(BaseRequestUserState<AuthResponse>(data: currentUser));
  }

  getTransactions(){
    return getTransactionsUseCase.execute();
  }

  getProfile(){
    return getProfileUseCase.execute();
  }


}