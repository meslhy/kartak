import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:graduation_project/data/model/responses/profile/ProfileResponse.dart';
import 'package:graduation_project/domain/repos/profile/profile_repo.dart';
import 'package:graduation_project/ui/utils/base_request_states.dart';
import 'package:injectable/injectable.dart';


@injectable
class GetProfileUseCase extends Cubit{

  ProfileRepo repo;

  GetProfileUseCase(this.repo):super(BaseRequestInitialState());

  execute()async{

    Either either = await repo.getProfile();

    either.fold(
            (failure) => emit(BaseRequestErrorState(failure.errorMessage)),
            (data) => emit(BaseRequestSuccessState<ProfileData>(data: data.data))
    );
  }

}