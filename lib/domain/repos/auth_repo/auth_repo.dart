import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../data/model/failures.dart';


abstract class AuthRepo{

  Future<Either<Failuer , bool>> login(String email , String pass);
  Future<Either<Failuer , bool>> register({
    required String name,
    required String password,
    required String passwordConfirm,
    required String email,
  });
}