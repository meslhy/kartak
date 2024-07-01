import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/domain/use_cases/add_place_use_case.dart';
import 'package:graduation_project/ui/utils/base_request_states.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddPlaceViewModel extends Cubit{

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController discountController = TextEditingController();
  TextEditingController ownerController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  AddPlaceUseCase addPlaceUseCase;
  bool isImageSelected = false;
  File? placeImage;


  AddPlaceViewModel(this.addPlaceUseCase):super(BaseRequestInitialState());

  Future<void> getImage() async {
    try {
      final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );

      if (pickedFile != null) {
        emit(placeImage = File(pickedFile.path));
        isImageSelected = true;
      }

      print(pickedFile);
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  addPlace(){
    return addPlaceUseCase.execute(nameController.text, descriptionController.text, discountController.text, placeImage!, categoryController.text, ownerController.text, codeController.text);
  }

}