import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../data/model/failures.dart';
import '../repos/auth_repo/auth_repo.dart';

@injectable
class RegisterUseCase {
  AuthRepo repo ;
  RegisterUseCase(this.repo);

  Future<Either<Failuer , bool>> execute({
    required name,
    required password,
    required email,
    required phone,
    required passwordConfirm,
    required image
  } ){
    return repo.register(
        name: name,
        email: email,
        phone: phone,
        password: password,
        passwordConfirm:passwordConfirm,
        image:image);
  }
}