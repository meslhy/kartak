import 'package:dartz/dartz.dart';
import 'package:graduation_project/data/model/failures.dart';
import 'package:graduation_project/data/model/responses/comments/PlaceCommentsResponse.dart';
import 'package:graduation_project/data/model/responses/places_response/placeDetailsResponse.dart';
import 'package:graduation_project/data/model/responses/places_response/places_response.dart';

abstract class HomeRepo{

  Future<Either<Failuer,List<PlacesDM>>> getPlaces();
  Future<Either<Failuer, PlaceDetailsResponse>> getSpecificPlace(String id);
  Future<Either<Failuer,bool>> createCommentAndRate(String userID , String placeID ,String comment , String rate);
  Future<Either<Failuer,PlaceCommentsResponse>> getPlaceComments(String id);

}