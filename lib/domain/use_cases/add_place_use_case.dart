import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:graduation_project/domain/repos/profile/profile_repo.dart';
import 'package:graduation_project/ui/utils/base_request_states.dart';
import 'package:injectable/injectable.dart';


@injectable
class AddPlaceUseCase extends Cubit{
  
  ProfileRepo repo;
  
  AddPlaceUseCase(this.repo):super(BaseRequestInitialState());
  
  execute( String name, String description, String discount,File imageCover, String category, String owner, String code)async{
    
    Either either = await repo.addPlace(name, description, discount, imageCover, category, owner, code);
    
    either.fold(
            (failure) => emit(BaseRequestErrorState(failure.errorMessage)),
            (data) => emit(BaseRequestSuccessState())
    );
  }
  
  
}