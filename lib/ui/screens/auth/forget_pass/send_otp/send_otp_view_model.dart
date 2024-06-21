
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../data/model/failures.dart';
import '../../../../../domain/use_cases/send_otp_use_case.dart';
import '../../../../utils/base_request_states.dart';


@injectable
class SendOTPViewModel extends Cubit{

  GlobalKey<FormState> sendOTPKey = GlobalKey();
  SendOTPUseCase sendOTPUseCase;
  TextEditingController emailController = TextEditingController() ;

  SendOTPViewModel(this.sendOTPUseCase):super(BaseRequestInitialState());

  sendOTP()async{

    if(!sendOTPKey.currentState!.validate())return;
    emit(BaseRequestLoadingState());
    Either<Failuer, bool> response = await
    sendOTPUseCase.execute(emailController.text);

    response.fold(
            (error) {
          emit(BaseRequestErrorState(error.errorMessage));
        },
            (success) {
          emit(BaseRequestSuccessState());
        });

  }

}