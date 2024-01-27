import 'dart:io';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:graduation_project/data/model/responses/loginResponse.dart';
import 'package:graduation_project/data/utils/shared_utils.dart';
import 'package:graduation_project/ui/utils/app_assets.dart';
import 'package:graduation_project/ui/utils/base_request_states.dart';
import 'package:injectable/injectable.dart';


@injectable
class ProfileViewModel extends Cubit{
  File? file;
  File? picture1;
  String picture = AppAssets.me;
  UserData? currentUser;
  ProfileViewModel():super(BaseRequestInitialState());

  getUser()async{

     currentUser = await SharedPrefsUtils().getUser();
     emit(BaseRequestSuccessState<UserData>(data: currentUser));
  }



}