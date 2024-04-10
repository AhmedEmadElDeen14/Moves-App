import 'package:bloc/bloc.dart';
import 'package:movies_app/features/movie_details/domain/use_cases/get_movie_details_use_case.dart';
import 'package:movies_app/features/movie_details/presentation/bloc/movie_details_event.dart';
import 'package:movies_app/features/movie_details/presentation/bloc/movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  GetMovieDetailsUseCase getMovieDetailsUseCase;
  GetSimilarMoviesUseCase getSimilarMoviesUseCase;
  String movieId;

  MovieDetailsBloc(
      this.getMovieDetailsUseCase, this.getSimilarMoviesUseCase, this.movieId)
      : super(MovieDetailsInitial()) {
    on<MovieDetailsEvent>((event, emit) async {
      if (event is MovieDetailsGetMovie) {
        emit(state.copyWith(type: ScreenType.loading));
        var res = await getMovieDetailsUseCase.call(movieId);
        res.fold((l) {
          emit(state.copyWith(type: ScreenType.failures, failures: l));
        }, (r) {
          emit(state.copyWith(type: ScreenType.success, movie: r));
        });
      }
      else if(event is MovieDetailsGetSimilarMovies){
        emit(state.copyWith(type: ScreenType.loading));
        var res = await getSimilarMoviesUseCase.call(movieId);
        res.fold((l) {
          emit(state.copyWith(type: ScreenType.failures,failures: l));
        }, (r) {
          emit(state.copyWith(type: ScreenType.success,movies: r.results));
        });
      }
    });
  }
}
