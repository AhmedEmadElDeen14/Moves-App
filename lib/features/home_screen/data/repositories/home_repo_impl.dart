import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/features/home_screen/data/data_sources/Home_remote_ds.dart';
import 'package:movies_app/features/home_screen/data/models/MoviesModel.dart';
import 'package:movies_app/features/home_screen/domain/repositories/home_repo.dart';

class HomeRepoImpl implements HomeRepo{

  HomeRemoteDS homeRemoteDS;

  HomeRepoImpl(this.homeRemoteDS);

  @override
  Future<Either<Failures, MoviesModel>> getPopularMovies() {
    return homeRemoteDS.getPopularMovies();
  }

  @override
  Future<Either<Failures, MoviesModel>> getNewReleasesMovies() {
    return homeRemoteDS.getNewReleasesMovies();
  }

  @override
  Future<Either<Failures, MoviesModel>> getRecommendedMovies() {
    return homeRemoteDS.getRecommendedMovies();
  }





}