import 'package:dartz/dartz.dart';
import 'package:graduation_project/data/model/failures.dart';
import 'package:graduation_project/data/model/responses/places_response/places_response.dart';

abstract class HomeRepo{

  Future<Either<Failuer,List<PlacesDM>>> getPlaces();
}