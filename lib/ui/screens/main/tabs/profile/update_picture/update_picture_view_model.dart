import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:graduation_project/data/model/responses/auth_response/AuthResponse.dart';
import 'package:graduation_project/domain/use_cases/get_profile_use_case.dart';
import 'package:graduation_project/domain/use_cases/update_photo_use_case.dart';
import 'package:graduation_project/ui/utils/base_request_states.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdatePictureViewModel extends Cubit{

 UpdatePhotoUseCase updatePhotoUseCase;
  GetProfileUseCase getProfileUseCase;

  UpdatePictureViewModel(this.getProfileUseCase,this.updatePhotoUseCase):super(BaseRequestInitialState());


  getProfileInf(){
    return getProfileUseCase.execute();
  }
  _updatePicture( File picture){

    return updatePhotoUseCase.execute( picture);
  }

  Future<void> getImageAndUpdate() async {
    try {
      final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );

      if (pickedFile != null) {
        await _updatePicture(File(pickedFile.path));
        await getProfileInf();

      }

      print(pickedFile?.path);
    } catch (e) {
      print('Error picking image: $e');
    }
  }
}