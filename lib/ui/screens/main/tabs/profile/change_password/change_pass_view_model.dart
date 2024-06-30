


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/domain/use_cases/change_pass_use_case.dart';
import 'package:graduation_project/ui/utils/base_request_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class ChangePassViewModel extends Cubit{

  TextEditingController oldPassController = TextEditingController();
  TextEditingController newPassController = TextEditingController();
  TextEditingController confirmNewController = TextEditingController();
  ChangePassUseCase changePassUseCase;
  ChangePassViewModel(this.changePassUseCase):super(BaseRequestInitialState());

 changePass(){
   return changePassUseCase.execute(oldPassController.text, newPassController.text, confirmNewController.text);
 }


}