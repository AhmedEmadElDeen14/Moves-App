import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';
import '../../domain/repositories/movie_search_repo.dart';
import '../data_sources/movie_search_remote_ds.dart';
import '../models/MovieSearchModel.dart';

class MovieSearchRepoImpl implements MovieSearchRepo{

  MovieSearchRemoteDS movieSearchRemoteDS;

  MovieSearchRepoImpl(this.movieSearchRemoteDS);

  @override
  Future<Either<Failures, MovieSearchModel>> getMovieSearch(String movieName) {
    return movieSearchRemoteDS.getMovieSearch(movieName);
  }



}