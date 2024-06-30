import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:graduation_project/data/model/failures.dart';
import 'package:graduation_project/data/model/responses/auth_response/AuthResponse.dart';
import 'package:graduation_project/data/model/responses/users/AllUsersResponse.dart';

abstract class ProfileOnlineDS {

  Future<Either<Failuer,AuthResponse>>getProfile();
  Future<Either<Failuer,AllUsersResponse>>getAllUsers();
  Future<Either<Failuer, AuthResponse>> getSpecificUsers(String id);
  Future<Either<Failuer,bool>>updatePhoto( File image);
}