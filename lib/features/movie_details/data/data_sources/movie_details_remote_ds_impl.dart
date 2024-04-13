import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/core/api/api_manager.dart';
import 'package:movies_app/core/api/end_points.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/features/home_screen/data/models/MoviesModel.dart';
import 'package:movies_app/features/movie_details/data/data_sources/movie_details_remote_ds.dart';
import 'package:movies_app/features/movie_details/data/models/movie_model.dart';

class MovieDetailsRemoteDSImpl implements MovieDetailsRemoteDS {
  ApiManager apiManager;

  MovieDetailsRemoteDSImpl(this.apiManager);

  @override
  Future<Either<Failures, MovieModel>> getMovieDetails(String movieId) async {
    try {
      Response response = await apiManager.getData(
        endPoint: EndPoints.details+'/$movieId',);
      MovieModel model = MovieModel.fromJson(response.data);
      return Right(model);
    }catch (e){
      return left(RemoteFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, MoviesModel>> getSimilarMovie(String movieId) async {
    try {
      Response response = await apiManager.getData(
        endPoint: '${EndPoints.details}/$movieId/similar',);
      MoviesModel model = MoviesModel.fromJson(response.data);
      return Right(model);
    }catch (e){
      return left(RemoteFailure(e.toString()));
    }
  }


}