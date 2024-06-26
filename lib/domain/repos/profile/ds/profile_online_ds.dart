import 'package:dartz/dartz.dart';
import 'package:graduation_project/data/model/failures.dart';
import 'package:graduation_project/data/model/responses/profile/ProfileResponse.dart';
import 'package:graduation_project/data/model/responses/users/AllUsersResponse.dart';

abstract class ProfileOnlineDS {

  Future<Either<Failuer,ProfileResponse>>getProfile();
  Future<Either<Failuer,AllUsersResponse>>getAllUsers();
}