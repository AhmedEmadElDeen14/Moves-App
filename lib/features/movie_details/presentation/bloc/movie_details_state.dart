import 'package:movies_app/core/enum/screen_state.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/features/home_screen/data/models/MoviesModel.dart';
import 'package:movies_app/features/movie_details/data/models/movie_model.dart';


class MovieDetailsState {
  ScreenType? type;
  Failures? failures;
  MovieModel? movie;
  List<Results>? movies;

  MovieDetailsState({this.type, this.failures, this.movie, this.movies});

  MovieDetailsState copyWith(
      {ScreenType? type,
      Failures? failures,
      MovieModel? movie,
      List<Results>? movies}) {
    return MovieDetailsState(
        type: type ?? this.type,
        failures: failures ?? this.failures,
        movie: movie ?? this.movie,
        movies: movies ?? this.movies);
  }
}

class MovieDetailsInitial extends MovieDetailsState {
  MovieDetailsInitial() : super(type: ScreenType.init);
}
