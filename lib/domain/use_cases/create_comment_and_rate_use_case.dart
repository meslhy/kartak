import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:graduation_project/domain/repos/home_repo/home_repo.dart';
import 'package:graduation_project/ui/utils/base_request_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class CreateCommentAndRateUseCase extends Cubit{

  HomeRepo homeRepo;

  CreateCommentAndRateUseCase(this.homeRepo):super(BaseRequestInitialState());


  execute(String userID,String placeID,String comment,String rate)async{
    Either either = await homeRepo.createCommentAndRate(userID, placeID, comment, rate);

    either.fold(
            (failure) => emit(BaseRequestErrorState(failure.errorMessage)),
            (data) => BaseRequestSuccessState(),
    );
  }

}