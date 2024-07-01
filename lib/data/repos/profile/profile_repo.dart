import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:graduation_project/data/model/failures.dart';
import 'package:graduation_project/data/model/responses/users/AllUsersResponse.dart';
import 'package:graduation_project/ui/utils/constants.dart';
import 'package:graduation_project/ui/utils/extensions.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/repos/profile/ds/profile_online_ds.dart';
import '../../../domain/repos/profile/profile_repo.dart';
import '../../model/responses/auth_response/AuthResponse.dart';

@Injectable(as:ProfileRepo )
class ProfileRepoImpl extends ProfileRepo{

  Connectivity connectivity ;
  ProfileOnlineDS profileOnlineDS;

  ProfileRepoImpl(this.connectivity,this.profileOnlineDS);

  @override
  Future<Either<Failuer, AuthResponse>> getProfile() async{

    if(await connectivity.isInternetConnective){
      return profileOnlineDS.getProfile();
    }else{
      return left(Failuer(Constants.internetErrorMessage));
    }

  }

  @override
  Future<Either<Failuer, AllUsersResponse>> getAllUsers() async{
    if(await connectivity.isInternetConnective){
      return profileOnlineDS.getAllUsers();
    }else{
      return left(Failuer(Constants.internetErrorMessage));
    }
  }

  @override
  Future<Either<Failuer, bool>> updatePhoto(File image) async{
   if(await connectivity.isInternetConnective){
     return profileOnlineDS.updatePhoto(image);
   }else{
     return left(Failuer(Constants.internetErrorMessage));
   }
  }

  @override
  Future<Either<Failuer, AuthResponse>> getSpecificUsers(String id) async{
    if(await connectivity.isInternetConnective){
      return profileOnlineDS.getSpecificUsers(id);
    }else{
      return left(Failuer(Constants.internetErrorMessage));
    }
  }

  @override
  Future<Either<Failuer, bool>> addPlace(String name, String description, String discount, File imageCover, String category, String owner, String code) async{
    if(await connectivity.isInternetConnective){
      return profileOnlineDS.addPlace(name, description, discount, imageCover, category, owner, code);
    }else{
      return left(Failuer(Constants.internetErrorMessage));
    }
  }


}