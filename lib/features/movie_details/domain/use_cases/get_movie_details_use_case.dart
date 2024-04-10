import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/features/home_screen/data/models/MoviesModel.dart';
import 'package:movies_app/features/movie_details/data/models/movie_model.dart';
import 'package:movies_app/features/movie_details/domain/repositories/movie_details_repo.dart';

class GetMovieDetailsUseCase {
  MovieDetailsRepo movieDetailsRepo;

  GetMovieDetailsUseCase(this.movieDetailsRepo);

  Future<Either<Failures, MovieModel>> call(String movieId) =>
      movieDetailsRepo.getMovieDetails(movieId);
}


class GetSimilarMoviesUseCase {
  MovieDetailsRepo movieDetailsRepo;

  GetSimilarMoviesUseCase(this.movieDetailsRepo);

  Future<Either<Failures, MoviesModel>> call(String movieId) =>
      movieDetailsRepo.getSimilarMovies(movieId);
}


