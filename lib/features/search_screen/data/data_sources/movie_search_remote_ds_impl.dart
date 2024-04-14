import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/core/api/api_manager.dart';
import 'package:movies_app/core/api/end_points.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/features/search_screen/data/models/MovieSearchModel.dart';

import 'movie_search_remote_ds.dart';

class MovieSearchRemoteDSImpl implements MovieSearchRemoteDS {
  ApiManager apiManager;

  MovieSearchRemoteDSImpl(this.apiManager);

  @override
  Future<Either<Failures, MovieSearchModel>> getMovieSearch(String movieName) async {
    try {
      Response response = await apiManager.getData(
        endPoint: '${EndPoints.details}/$movieName',);
      MovieSearchModel model = MovieSearchModel.fromJson(response.data);
      return Right(model);
    }catch (e){
      return left(RemoteFailure(e.toString()));
    }
  }


}