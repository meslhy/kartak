// import 'dart:io';
//
// import 'package:bloc/bloc.dart';
// import 'package:graduation_project/domain/use_cases/get_profile_inf_use_case.dart';
// import 'package:graduation_project/domain/use_cases/update_picture_use_case.dart';
// import 'package:graduation_project/ui/utils/base_request_states.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:injectable/injectable.dart';
//
// @injectable
// class UpdatePictureViewModel extends Cubit{
//
//   UpdatePictureUseCase updatePictureUseCase;
//   GetProfileInfUseCase getProfileInfUseCase;
//
//   UpdatePictureViewModel(this.getProfileInfUseCase,this.updatePictureUseCase):super(BaseRequestInitialState());
//
//
//   getProfileInf(){
//     return getProfileInfUseCase.execute();
//   }
//   _updatePicture( File picture){
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
//         await _updatePicture(File(pickedFile.path));
//         await getProfileInf();
//
//       }
//
//       print(pickedFile?.path);
//     } catch (e) {
//       print('Error picking image: $e');
//     }
//   }
// }