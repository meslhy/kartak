// import 'dart:io';
// import 'package:bloc/bloc.dart';
// import 'package:graduation_project/data/model/responses/loginResponse.dart';
// import 'package:graduation_project/data/utils/shared_utils.dart';
// import 'package:graduation_project/domain/use_cases/update_picture_use_case.dart';
// import 'package:graduation_project/ui/utils/app_assets.dart';
// import 'package:graduation_project/ui/utils/base_request_states.dart';
// import 'package:graduation_project/ui/utils/constants.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:injectable/injectable.dart';
//
// import '../../../../../domain/use_cases/get_profile_inf_use_case.dart';
//
//
// @injectable
// class ProfileViewModel extends Cubit{
//   LoginResponseData? currentUser;
//   SharedPrefsUtils sharedPrefsUtils;
//   UpdatePictureUseCase updatePictureUseCase;
//   GetProfileInfUseCase getProfileInfUseCase;
//   ProfileViewModel(this.updatePictureUseCase,this.getProfileInfUseCase,this.sharedPrefsUtils):super(BaseRequestInitialState());
//
//
//
//
//   getUser()async {
//   emit(BaseRequestLoadingState());
//   try{
//     currentUser = await SharedPrefsUtils().getUser();
//     emit(BaseRequestSuccessState<LoginResponseData>(data: currentUser));
//   }catch(e){
//     emit(BaseRequestErrorState(Constants.defaultErrorMessage));
//   }
//
//
// }
//   getProfileInf()async{
//     getProfileInfUseCase.execute();
//   }
//   updatePicture( File picture){
//
//     return updatePictureUseCase.execute( picture);
//   }
//
//   Future<void> getImageAndUpdate() async {
//     try {
//       final pickedFile = await ImagePicker().pickImage(
//         source: ImageSource.gallery,
//       );
//
//       if (pickedFile != null) {
//         await updatePicture(File(pickedFile.path));
//         await getProfileInf();
//
//       }
//
//       print(pickedFile?.path);
//     } catch (e) {
//       print('Error picking image: $e');
//     }
//   }
//   logOut(){
//     sharedPrefsUtils.saveUser(LoginResponseData());
//     sharedPrefsUtils.saveToken("");
//   }
// }
