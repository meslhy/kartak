
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../data/model/failures.dart';
import '../repos/auth_repo/auth_repo.dart';

@injectable
class VerificationOTPUseCase{

  AuthRepo repo;
  VerificationOTPUseCase(this.repo);

  Future<Either<Failuer , bool>> execute(String otp, String pass , String confirmPass){
    return repo.verificationOTP(otp, pass , confirmPass);
  }
}