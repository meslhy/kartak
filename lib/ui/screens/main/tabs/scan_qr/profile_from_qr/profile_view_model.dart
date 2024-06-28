import 'package:bloc/bloc.dart';
import 'package:graduation_project/data/model/responses/auth_response/AuthResponse.dart';
import 'package:graduation_project/data/utils/shared_utils.dart';
import 'package:graduation_project/domain/use_cases/get_specific_user_use_case.dart';
import 'package:graduation_project/domain/use_cases/get_places_use_case.dart';
import 'package:graduation_project/domain/use_cases/get_profile_use_case.dart';
import 'package:graduation_project/domain/use_cases/get_users_use_case.dart';
import 'package:graduation_project/ui/utils/base_request_states.dart';
import 'package:graduation_project/ui/utils/constants.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProfileFromQRViewModel extends Cubit{
  AuthResponse? currentUser;
  SharedPrefsUtils sharedPrefsUtils;
  GetPlacesUseCase getAllPlacesUseCase;
  GetUsersUseCase getUsersUseCase;
  GetSpecificUserUseCase getSpecificUserUseCase;
  ProfileFromQRViewModel(this.sharedPrefsUtils,this.getAllPlacesUseCase,this.getUsersUseCase,this.getSpecificUserUseCase):super(BaseRequestInitialState());




  getUser()async {
  emit(BaseRequestLoadingState());
  try{
    currentUser = await SharedPrefsUtils().getUser();
    emit(BaseRequestSuccessState<AuthResponse>(data: currentUser));
  }catch(e){
    emit(BaseRequestErrorState(Constants.defaultErrorMessage));
  }


}



  getAllPlaces(){
    return getAllPlacesUseCase.execute();
  }

  getAllUsers()async{
    return getUsersUseCase.execute();
  }

  getProfileUser(String id){
    return getSpecificUserUseCase.execute(id);
  }

}
