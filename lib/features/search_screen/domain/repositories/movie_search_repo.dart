import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/features/search_screen/data/models/MovieSearchModel.dart';

abstract class MovieSearchRepo {

  Future<Either<Failures, MovieSearchModel>> getMovieSearch(String movieName);



}