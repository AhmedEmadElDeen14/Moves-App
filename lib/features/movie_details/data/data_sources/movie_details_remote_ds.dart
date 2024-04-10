import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/features/home_screen/data/models/MoviesModel.dart';
import 'package:movies_app/features/movie_details/data/models/movie_model.dart';

abstract class MovieDetailsRemoteDS{

  Future<Either<Failures, MovieModel>> getMovieDetails(String movieId);

  Future<Either<Failures, MoviesModel>> getSimilarMovie(String movieId);



}