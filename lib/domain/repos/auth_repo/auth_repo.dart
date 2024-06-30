import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../data/model/failures.dart';


abstract class AuthRepo{

  Future<Either<Failuer , bool>> login(String email , String pass);
  Future<Either<Failuer , bool>> register({
    required String name,
    required String password,
    required String phone,
    required String passwordConfirm,
    required String email,
    required File image
  });

  Future<Either<Failuer , bool>> sendOTP (String email);
  Future<Either<Failuer , bool>> verificationOTP (String otp, String pass , String confirmPass);
  Future<Either<Failuer , bool>> changePassword (String oldPass ,String newPass , String confirmNewPass);

}