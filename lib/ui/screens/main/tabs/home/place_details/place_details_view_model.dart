import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/data/model/responses/auth_response/AuthResponse.dart';
import 'package:graduation_project/data/utils/shared_utils.dart';
import 'package:graduation_project/domain/use_cases/create_comment_and_rate_use_case.dart';
import 'package:graduation_project/domain/use_cases/get_specific_place_use_case.dart';
import 'package:graduation_project/ui/utils/base_request_states.dart';
import 'package:injectable/injectable.dart';

@injectable
class PlaceDetailsViewModel extends Cubit {

  bool isExpanded = false;
  TextEditingController commentController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  GetSpecificPlacesUseCase getSpecificPlacesUseCase ;
  CreateCommentAndRateUseCase createCommentAndRateUseCase;

  PlaceDetailsViewModel(this.getSpecificPlacesUseCase,this.createCommentAndRateUseCase):super(BaseRequestInitialState());

  getSpecificPlace(String id){

    return getSpecificPlacesUseCase.execute(id);
  }

  createCommentAndRate(String placeID)async{

    AuthResponse? user =await (SharedPrefsUtils().getUser());
    String userID = user!.data!.id??"";
    if(rateController.text.isEmpty) rateController.text ="0";
    if(commentController.text.isEmpty) commentController.text ="   ";
    if(int.parse(rateController.text) > 5) rateController.text ="5";
    if(int.parse(rateController.text) < 0) rateController.text ="0";
    return createCommentAndRateUseCase.execute(userID, placeID, commentController.text, rateController.text);
  }

}