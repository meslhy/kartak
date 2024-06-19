import 'package:bloc/bloc.dart';
import 'package:graduation_project/domain/use_cases/get_places_use_case.dart';
import 'package:graduation_project/ui/utils/base_request_states.dart';
import 'package:injectable/injectable.dart';
import '../../../../../data/model/responses/auth_response/auth_response.dart';
import '../../../../../data/utils/shared_utils.dart';

@injectable
class HomeViewModel extends Cubit{
  AuthResponse? currentUser;
  GetPlacesUseCase getPlacesUseCase;
  HomeViewModel(this.getPlacesUseCase) : super(BaseRequestInitialState());

  getUser()async{
    currentUser = await SharedPrefsUtils().getUser();
    emit(BaseRequestUserState<AuthResponse>(data: currentUser));
  }

  getPlaces(){
    getPlacesUseCase.execute();
  }


}

class BaseRequestUserState<type> extends BaseRequestStates {
  type? data;
  BaseRequestUserState({this.data});
}