import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../data/model/failures.dart';


abstract class AuthRepo{

  Future<Either<Failuer , bool>> login(String email , String pass);
  Future<Either<Failuer , bool>> register({
    required firstName,
    required lastName,
    required password,
    required email,
    required File? avatar
  });
}