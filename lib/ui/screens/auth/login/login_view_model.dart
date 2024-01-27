import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/domain/use_cases/login_use_case.dart';
import 'package:injectable/injectable.dart';

import '../../../../data/model/failures.dart';
import '../../../utils/base_request_states.dart';


@injectable
class LoginViewModel extends Cubit{
  TextEditingController emailController =TextEditingController();
  TextEditingController passController =TextEditingController();
  LoginUseCase loginUseCase ;
  bool isPass = true;
  IconData icon = Icons.remove_red_eye_outlined;

  LoginViewModel(this.loginUseCase):super(BaseRequestInitialState());

  void login() async {
    emit(BaseRequestLoadingState());
    Either<Failuer, bool> response = await
    loginUseCase.execute(emailController.text.trim(), passController.text.trim());

    response.fold(
            (error) {
          emit(BaseRequestErrorState(error.errorMessage));
        },
            (success) {
          emit(BaseRequestSuccessState());
        });
  }

}