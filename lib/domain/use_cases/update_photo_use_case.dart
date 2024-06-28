import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:graduation_project/domain/repos/profile/profile_repo.dart';
import 'package:graduation_project/ui/utils/base_request_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdatePhotoUseCase extends Cubit{

  ProfileRepo repo;

  UpdatePhotoUseCase(this.repo):super(BaseRequestSuccessState());

  execute(File image)async{
    Either either = await repo.updatePhoto(image);

    either.fold(
            (failure) => emit(BaseRequestErrorState(failure.errormessage)),
            (data) => emit(BaseRequestSuccessState<bool>(data: data))
    );
  }
}