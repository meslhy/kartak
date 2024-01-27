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
    required firstName,
    required lastName,
    required password,
    required email,
    required File? avatar,
  } ){
    return repo.register(firstName: firstName,lastName: lastName,email: email,password: password,avatar:avatar);
  }
}