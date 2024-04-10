import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/features/home_screen/data/models/MoviesModel.dart';
import 'package:movies_app/features/home_screen/domain/repositories/home_repo.dart';

class GetPopularMovieUseCase{

  HomeRepo homeRepo;

  GetPopularMovieUseCase(this.homeRepo);

  Future<Either<Failures, MoviesModel>> call() => homeRepo.getPopularMovies();

}

class GetNewReleasesMovieUseCase{

  HomeRepo homeRepo;

  GetNewReleasesMovieUseCase(this.homeRepo);

  Future<Either<Failures, MoviesModel>> call() => homeRepo.getNewReleasesMovies();

}

class GetRecommendedMovieUseCase{

  HomeRepo homeRepo;

  GetRecommendedMovieUseCase(this.homeRepo);

  Future<Either<Failures, MoviesModel>> call() => homeRepo.getRecommendedMovies();

}