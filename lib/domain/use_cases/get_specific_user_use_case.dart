import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:graduation_project/data/model/responses/auth_response/AuthResponse.dart';
import 'package:graduation_project/domain/repos/profile/profile_repo.dart';
import 'package:graduation_project/ui/utils/base_request_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetSpecificUserUseCase extends Cubit{

  ProfileRepo profileRepo;

  GetSpecificUserUseCase(this.profileRepo):super(BaseRequestInitialState());

  execute(String id)async{
    Either either = await profileRepo.getSpecificUsers(id);

    either.fold(
            (failure) => emit(BaseRequestErrorState(failure.errorMessage)),
            (data) => emit(BaseRequestSuccessState<AuthData>(data: data.data)),
    );
  }

}