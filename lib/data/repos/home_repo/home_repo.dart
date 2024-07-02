import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:graduation_project/data/model/failures.dart';
import 'package:graduation_project/data/model/responses/comments/PlaceCommentsResponse.dart';
import 'package:graduation_project/data/model/responses/places_response/placeDetailsResponse.dart';
import 'package:graduation_project/data/model/responses/places_response/places_response.dart';
import 'package:graduation_project/domain/repos/home_repo/ds/home_online_ds.dart';
import 'package:graduation_project/domain/repos/home_repo/home_repo.dart';
import 'package:graduation_project/ui/utils/constants.dart';
import 'package:graduation_project/ui/utils/extensions.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepo)
class HomeRepoImpl extends HomeRepo{

  Connectivity connectivity;
  HomeOnlineDS homeOnlineDS;
  HomeRepoImpl(this.homeOnlineDS,this.connectivity);


  @override
  Future<Either<Failuer, List<PlacesDM>>> getPlaces() async{
    if(await connectivity.isInternetConnective){
      return homeOnlineDS.getPlaces();
    }else{
      return left(Failuer(Constants.internetErrorMessage));
    }
  }


  @override
  Future<Either<Failuer, PlaceDetailsResponse>> getSpecificPlace(String id) async{
    if(await connectivity.isInternetConnective){
      return homeOnlineDS.getSpecificPlace(id);
    }else{
      return left(Failuer(Constants.internetErrorMessage));
    }
  }

  @override
  Future<Either<Failuer, bool>> createCommentAndRate(String userID, String placeID, String comment, String rate) async{
   if(await connectivity.isInternetConnective){
     return homeOnlineDS.createCommentAndRate(userID, placeID, comment, rate);
   }else{
     return left(Failuer(Constants.internetErrorMessage));
   }
  }

  @override
  Future<Either<Failuer, PlaceCommentsResponse>> getPlaceComments(String id) async{
    // TODO: implement getPlaceComments
    if(await connectivity.isInternetConnective){
      return homeOnlineDS.getPlaceComments(id);
    }else{
      return left(Failuer(Constants.internetErrorMessage));
    }
  }


}