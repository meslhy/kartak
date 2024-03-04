import 'package:bloc/bloc.dart';
import 'package:graduation_project/ui/utils/base_request_states.dart';
import 'package:injectable/injectable.dart';
import '../../../../../data/model/responses/auth_responses/auth_response.dart';
import '../../../../../data/utils/shared_utils.dart';

@injectable
class HomeViewModel extends Cubit{
  AuthResponse? currentUser;
  HomeViewModel() : super(BaseRequestInitialState());

  getUser()async{
    currentUser = await SharedPrefsUtils().getUser();
    emit(BaseRequestSuccessState<AuthResponse>(data: currentUser));
  }



}