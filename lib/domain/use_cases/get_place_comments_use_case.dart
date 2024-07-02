import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:graduation_project/data/model/responses/comments/PlaceCommentsResponse.dart';
import 'package:graduation_project/domain/repos/home_repo/home_repo.dart';
import 'package:graduation_project/ui/utils/base_request_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetPlaceCommentsUseCase extends Cubit{
  
  HomeRepo repo;
  
  GetPlaceCommentsUseCase(this.repo):super(BaseRequestInitialState());
  
  execute(String id)async{
    
    Either either = await repo.getPlaceComments(id);
    
    either.fold(
            (failure) => emit(BaseRequestErrorState(failure.errorMessage)),
            (data) => emit(BaseRequestSuccessState<PlaceCommentsResponse>(data: data))
    );
    
  }
  
}