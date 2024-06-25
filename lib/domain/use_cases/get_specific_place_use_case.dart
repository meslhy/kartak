import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:graduation_project/data/model/failures.dart';
import 'package:graduation_project/data/model/responses/places_response/placeDetailsResponse.dart';
import 'package:graduation_project/data/model/responses/places_response/places_response.dart';
import 'package:graduation_project/domain/repos/home_repo/home_repo.dart';
import 'package:graduation_project/ui/utils/base_request_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetSpecificPlacesUseCase extends Cubit{
  HomeRepo repo;
  GetSpecificPlacesUseCase(this.repo):super(BaseRequestInitialState());

  void execute(String id)async{

    Either<Failuer,PlaceDetailsResponse> either = await repo.getSpecificPlace(id);

    return either.fold(
            (failure) => emit(BaseRequestErrorState(failure.errorMessage)),
            (data) => emit(BaseRequestSuccessState<PlaceDetailsData>(data: data.data)));
  }



}