
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../data/model/failures.dart';
import '../../../../../domain/use_cases/verification_otp_use_case.dart';
import '../../../../utils/base_request_states.dart';

@injectable
class VerificationOTPViewModel extends Cubit{

  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  VerificationOTPUseCase verificationOTPUseCase;
  VerificationOTPViewModel(this.verificationOTPUseCase):super(BaseRequestInitialState());

  verificationOTP()async{
    if(otpController.text == "")return;
    emit(BaseRequestLoadingState());
    Either<Failuer, bool> response = await
    verificationOTPUseCase.execute(otpController.text, passController.text , confirmPassController.text);

    response.fold(
            (error) {
          emit(BaseRequestErrorState(error.errorMessage));
        },
            (success) {
          emit(BaseRequestSuccessState());
        });
  }


}