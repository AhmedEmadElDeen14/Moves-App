import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/features/home_screen/data/models/MoviesModel.dart';
import 'package:movies_app/features/movie_details/data/data_sources/movie_details_remote_ds.dart';
import 'package:movies_app/features/movie_details/data/models/movie_model.dart';
import 'package:movies_app/features/movie_details/domain/repositories/movie_details_repo.dart';

class MovieDetailsRepoImpl implements MovieDetailsRepo{

  MovieDetailsRemoteDS movieDetailsRemoteDS;

  MovieDetailsRepoImpl(this.movieDetailsRemoteDS);


  @override
  Future<Either<Failures, MovieModel>> getMovieDetails(String movieId) {
    return movieDetailsRemoteDS.getMovieDetails(movieId);
  }

  @override
  Future<Either<Failures, MoviesModel>> getSimilarMovies(String movieId) {
    return movieDetailsRemoteDS.getSimilarMovie(movieId);
  }





}