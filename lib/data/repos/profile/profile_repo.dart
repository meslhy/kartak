import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:graduation_project/data/model/failures.dart';
import 'package:graduation_project/data/model/responses/profile/ProfileResponse.dart';
import 'package:graduation_project/data/model/responses/users/AllUsersResponse.dart';
import 'package:graduation_project/ui/utils/constants.dart';
import 'package:graduation_project/ui/utils/extensions.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/repos/profile/ds/profile_online_ds.dart';
import '../../../domain/repos/profile/profile_repo.dart';

@Injectable(as:ProfileRepo )
class ProfileRepoImpl extends ProfileRepo{

  Connectivity connectivity ;
  ProfileOnlineDS profileOnlineDS;

  ProfileRepoImpl(this.connectivity,this.profileOnlineDS);

  @override
  Future<Either<Failuer, ProfileResponse>> getProfile() async{

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


}