import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/features/home_screen/data/models/MoviesModel.dart';

abstract class HomeRepo {

  Future<Either<Failures, MoviesModel>> getPopularMovies();

  Future<Either<Failures, MoviesModel>> getNewReleasesMovies();

  Future<Either<Failures, MoviesModel>> getRecommendedMovies();

}