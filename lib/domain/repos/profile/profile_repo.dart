import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:graduation_project/data/model/failures.dart';
import 'package:graduation_project/data/model/responses/auth_response/AuthResponse.dart';
import 'package:graduation_project/data/model/responses/users/AllUsersResponse.dart';

abstract class ProfileRepo{

  Future<Either<Failuer,AuthResponse>>getProfile();
  Future<Either<Failuer,AllUsersResponse>>getAllUsers();
  Future<Either<Failuer, AuthResponse>> getSpecificUsers(String id);
  Future<Either<Failuer,bool>>updatePhoto( File image);
  Future<Either<Failuer,bool>>addPlace( String name , String description, String discount,File imageCover , String category,String owner,String code);
}