import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:graduation_project/data/model/failures.dart';
import 'package:graduation_project/data/model/responses/comments/PlaceCommentsResponse.dart';
import 'package:graduation_project/data/model/responses/places_response/placeDetailsResponse.dart';
import 'package:graduation_project/data/model/responses/places_response/places_response.dart';
import 'package:graduation_project/data/utils/shared_utils.dart';
import 'package:graduation_project/domain/repos/home_repo/ds/home_online_ds.dart';
import 'package:graduation_project/shared_locale/helper.dart';
import 'package:graduation_project/ui/utils/constants.dart';
import 'package:graduation_project/ui/utils/end_points.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeOnlineDS)
class HomeOnlineDSImpl extends HomeOnlineDS{
  
  SharedPrefsUtils sharedPrefsUtils;
  SharedPreferenceGlobal sharedPreferenceGlobal;
  
  HomeOnlineDSImpl(this.sharedPrefsUtils,this.sharedPreferenceGlobal);
  
  @override
  Future<Either<Failuer, List<PlacesDM>>> getPlaces() async{
   try{
     Uri url = Uri.https(EndPoints.baseUrl,EndPoints.places);
     Response serverResponse = await get(url);
     PlaceResponse response = PlaceResponse.fromJson(jsonDecode(serverResponse.body));

     if(serverResponse.statusCode >= 200 && serverResponse.statusCode < 300){
       SharedPreferenceGlobal.putDataString(key: "allPlaces",value:serverResponse.body );
       return right(response.data!);
     }else{
       return left(Failuer(response.message?? Constants.defaultErrorMessage));
     }
   }catch(e,ee){
     return left(Failuer(e.toString()));
   }
  }
  
  Future<Either<Failuer, PlaceDetailsResponse>> getSpecificPlace(String id) async{
   try{
     Uri url = Uri.parse("https://${EndPoints.baseUrl}/api/place/$id");
     Response serverResponse = await get(url);
     PlaceDetailsResponse response = PlaceDetailsResponse.fromJson(jsonDecode(serverResponse.body));

     print("result is : ${serverResponse.body}");
     if(serverResponse.statusCode >= 200 && serverResponse.statusCode < 300){
       return right(response);
     }else{
       return left(Failuer(response.message?? Constants.defaultErrorMessage));
     }
   }catch(e,ee){
     return left(Failuer(e.toString()));
   }
  }

  @override
  Future<Either<Failuer, bool>> createCommentAndRate(String userID, String placeID, String comment, String rate) async{
  String token =await SharedPrefsUtils().getToken()??"";
  try{
    Uri url = Uri.https(EndPoints.baseUrl , EndPoints.review);
    Response serverResponse = await post(
        url,
      headers: {
          "authorization" : "Bearer $token",
        'Content-Type': 'application/json',
      },
      body:json.encode({
        "title":comment,
        "rate":rate,
        "user":userID,
        "place":placeID
      })
    );


    print("body of comment and rate is :${serverResponse.body}");
    if(serverResponse.statusCode >=200 && serverResponse.statusCode < 300){
      return right(true);
    }else{
      return left(Failuer(Constants.defaultErrorMessage));
    }
  }catch(e,ee){
    return left(Failuer(Constants.defaultErrorMessage));
  }
  }

  @override
  Future<Either<Failuer, PlaceCommentsResponse>> getPlaceComments(String id) async{
  try{
    Uri url = Uri.parse("https://${EndPoints.baseUrl}${EndPoints.placeComments}/$id");
    Response serverResponse = await get(url);
    PlaceCommentsResponse response = PlaceCommentsResponse.fromJson(jsonDecode(serverResponse.body));
    if(serverResponse.statusCode >= 200 && serverResponse.statusCode < 300){
      return right(response);
    }else{
      return left(Failuer(response.message??Constants.defaultErrorMessage));
    }
  }catch(e,ee){
    return left(Failuer(e.toString()));
  }
  }


  
}