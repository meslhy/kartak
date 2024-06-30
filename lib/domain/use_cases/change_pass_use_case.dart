import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:graduation_project/domain/repos/auth_repo/auth_repo.dart';
import 'package:graduation_project/ui/utils/base_request_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class ChangePassUseCase extends Cubit{

  AuthRepo repo;

  ChangePassUseCase(this.repo):super(BaseRequestInitialState());

  execute(String oldPass,String newPass,String confirmNewPass)async{
    Either either = await repo.changePassword(oldPass, newPass, confirmNewPass);

    either.fold(
            (failure) => emit(BaseRequestErrorState(failure.errorMessage)),
            (data) => emit(BaseRequestSuccessState())
    );
  }

}