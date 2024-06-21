
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../data/model/failures.dart';
import '../repos/auth_repo/auth_repo.dart';

@injectable
class SendOTPUseCase{
  AuthRepo repo;
  SendOTPUseCase(this.repo);

  Future<Either<Failuer , bool>> execute(String email){
    return repo.sendOTP(email);
  }
}