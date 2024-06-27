import 'package:bloc/bloc.dart';
import 'package:graduation_project/data/model/responses/auth_response/AuthResponse.dart';
import 'package:graduation_project/data/utils/shared_utils.dart';
import 'package:graduation_project/domain/use_cases/get_places_use_case.dart';
import 'package:graduation_project/domain/use_cases/get_profile_use_case.dart';
import 'package:graduation_project/domain/use_cases/get_users_use_case.dart';
import 'package:graduation_project/ui/utils/base_request_states.dart';
import 'package:graduation_project/ui/utils/constants.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProfileViewModel extends Cubit{
  AuthResponse? currentUser;
  SharedPrefsUtils sharedPrefsUtils;
  GetProfileUseCase getProfileUseCase;
  GetPlacesUseCase getAllPlacesUseCase;
  GetUsersUseCase getUsersUseCase;
  ProfileViewModel(this.sharedPrefsUtils ,this.getProfileUseCase,this.getAllPlacesUseCase,this.getUsersUseCase):super(BaseRequestInitialState());




  getUser()async {
  emit(BaseRequestLoadingState());
  try{
    currentUser = await SharedPrefsUtils().getUser();
    emit(BaseRequestSuccessState<AuthResponse>(data: currentUser));
  }catch(e){
    emit(BaseRequestErrorState(Constants.defaultErrorMessage));
  }


}


  getProfileInf()async{
    getProfileUseCase.execute();
  }

  getAllPlaces(){
    return getAllPlacesUseCase.execute();
  }

  getAllUsers()async{
    return getUsersUseCase.execute();
  }


  // updatePicture( File picture){
  //
  //   return updatePictureUseCase.execute( picture);
  // }

  // Future<void> getImageAndUpdate() async {
  //   try {
  //     final pickedFile = await ImagePicker().pickImage(
  //       source: ImageSource.gallery,
  //     );
  //
  //     if (pickedFile != null) {
  //       await updatePicture(File(pickedFile.path));
  //       await getProfileInf();
  //
  //     }
  //
  //     print(pickedFile?.path);
  //   } catch (e) {
  //     print('Error picking image: $e');
  //   }
  // }
  logOut(){
    sharedPrefsUtils.saveUser(AuthResponse());
    sharedPrefsUtils.saveToken("");
  }
}
