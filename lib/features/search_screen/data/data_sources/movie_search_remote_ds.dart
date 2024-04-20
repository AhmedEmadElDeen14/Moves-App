import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';
import '../models/MovieSearchModel.dart';

abstract class MovieSearchRemoteDS{

  Future<MovieSearchModel> getMovieSearch(String movieName);

}