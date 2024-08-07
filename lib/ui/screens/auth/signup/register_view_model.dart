import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

import '../../../../data/model/failures.dart';
import '../../../../domain/use_cases/register_use_case.dart';
import '../../../utils/base_request_states.dart';


@injectable
class RegisterViewModel extends Cubit{
  GlobalKey<FormState> registerKey = GlobalKey();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController rePass = TextEditingController();
  File? pickedImage;
  bool isImageSelected = false;
  RegisterUseCase useCase;
  RegisterViewModel(this.useCase):super(BaseRequestInitialState);

  void register() async{
    if(!registerKey.currentState!.validate())return;
    emit(BaseRequestLoadingState());
    Either<Failuer ,bool> response = await
    useCase.execute(name: name.text,phone: phone.text, password: pass.text, email: email.text, passwordConfirm: rePass.text, image: pickedImage);

    response.fold(
            (error){
          emit(BaseRequestErrorState(error.errorMessage));
        } ,
            (success) {
          emit(BaseRequestSuccessState());
        });
  }



  Future<void> getImage() async {
    try {
      final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );

      if (pickedFile != null) {
        emit(pickedImage = File(pickedFile.path));
        isImageSelected = true;
      }

      print(pickedFile);
    } catch (e) {
      print('Error picking image: $e');
    }
  }
}