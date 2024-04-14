import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';
import '../../data/models/MovieSearchModel.dart';
import '../repositories/movie_search_repo.dart';

class GetMovieSearchUseCase {
  MovieSearchRepo movieSearchRepo;

  GetMovieSearchUseCase(this.movieSearchRepo);

  Future<Either<Failures, MovieSearchModel>> call(String movieName) =>
      movieSearchRepo.getMovieSearch(movieName);
}



