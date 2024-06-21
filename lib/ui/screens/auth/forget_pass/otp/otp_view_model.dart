
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../data/model/failures.dart';
import '../../../../../domain/use_cases/verification_otp_use_case.dart';
import '../../../../utils/base_request_states.dart';

@injectable
class VerificationOTPViewModel extends Cubit{


  String otpText = "";
  VerificationOTPUseCase verificationOTPUseCase;
  VerificationOTPViewModel(this.verificationOTPUseCase):super(BaseRequestInitialState());

  verificationOTP()async{
    if(otpText == "")return;
    emit(BaseRequestLoadingState());
    Either<Failuer, bool> response = await
    verificationOTPUseCase.execute(otpText);

    response.fold(
            (error) {
          emit(BaseRequestErrorState(error.errorMessage));
        },
            (success) {
          emit(BaseRequestSuccessState());
        });
  }


}