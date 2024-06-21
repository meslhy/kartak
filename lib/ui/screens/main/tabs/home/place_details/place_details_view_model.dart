import 'package:bloc/bloc.dart';
import 'package:graduation_project/domain/use_cases/get_specific_place_use_case.dart';
import 'package:graduation_project/ui/utils/base_request_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class PlaceDetailsViewModel extends Cubit {

  bool isExpanded = false;
  GetSpecificPlacesUseCase useCase ;

  PlaceDetailsViewModel(this.useCase):super(BaseRequestInitialState());

  getSpecificPlace(String id){

    return useCase.execute(id);
  }

}