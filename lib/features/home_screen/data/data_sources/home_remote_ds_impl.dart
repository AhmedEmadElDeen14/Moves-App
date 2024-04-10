import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/core/api/api_manager.dart';
import 'package:movies_app/core/api/end_points.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/features/home_screen/data/data_sources/Home_remote_ds.dart';
import 'package:movies_app/features/home_screen/data/models/MoviesModel.dart';

class HomeRemoteDSImpl implements HomeRemoteDS {
  ApiManager apiManager;

  HomeRemoteDSImpl(this.apiManager);

  @override
  Future<Either<Failures, MoviesModel>> getPopularMovies() async {
    try {
      Response response = await apiManager.getData(
        endPoint: endPoints.popular,);
      MoviesModel model = MoviesModel.fromJson(response.data);
      return Right(model);
    }catch (e){
      return left(RemoteFailure(e.toString()));
    }
  }



  @override
  Future<Either<Failures, MoviesModel>> getNewReleasesMovies() async{
    try{
      Response response = await apiManager.getData(endPoint: endPoints.newReleases);
      MoviesModel model = MoviesModel.fromJson(response.data);
      return Right(model);
    }catch(e){
      return left(RemoteFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failures, MoviesModel>> getRecommendedMovies() async{
    try{
      Response response = await apiManager.getData(endPoint: endPoints.recommended);
      MoviesModel model = MoviesModel.fromJson(response.data);
      return Right(model);
    }catch(e){
      return left(RemoteFailure(e.toString()));
    }
  }


}