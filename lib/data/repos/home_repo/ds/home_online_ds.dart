import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:graduation_project/data/model/failures.dart';
import 'package:graduation_project/data/model/responses/places_response/places_response.dart';
import 'package:graduation_project/data/utils/shared_utils.dart';
import 'package:graduation_project/domain/repos/home_repo/ds/home_online_ds.dart';
import 'package:graduation_project/ui/utils/constants.dart';
import 'package:graduation_project/ui/utils/end_points.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeOnlineDS)
class HomeOnlineDSImpl extends HomeOnlineDS{
  
  SharedPrefsUtils sharedPrefsUtils;
  
  HomeOnlineDSImpl(this.sharedPrefsUtils);
  
  @override
  Future<Either<Failuer, List<PlacesDM>>> getPlaces() async{
   try{
     Uri url = Uri.https(EndPoints.baseUrl,EndPoints.places);
     Response serverResponse = await get(url);
     PlaceResponse response = PlaceResponse.fromJson(jsonDecode(serverResponse.body));

     if(serverResponse.statusCode >= 200 && serverResponse.statusCode < 300){
       return right(response.data!);
     }else{
       return left(Failuer(response.message?? Constants.defaultErrorMessage));
     }
   }catch(e,ee){
     return left(Failuer(e.toString()));
   }
  }
  
}