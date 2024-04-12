import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/enum/screen_state.dart';
import 'package:movies_app/features/home_screen/domain/use_cases/get_movies_use_case.dart';
import 'package:movies_app/features/home_screen/presentation/bloc/home_event.dart';
import 'package:movies_app/features/home_screen/presentation/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  GetPopularMovieUseCase getPopularMovieUseCase;
  GetNewReleasesMovieUseCase getNewReleasesMovieUseCase;
  GetRecommendedMovieUseCase getRecommendedMovieUseCase;

  int index = 0;

  HomeBloc(this.getPopularMovieUseCase, this.getNewReleasesMovieUseCase,
      this.getRecommendedMovieUseCase)
      : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      if (event is HomeGetPopularMovie) {
        emit(state.copyWith(type: ScreenType.loading));
        var res = await getPopularMovieUseCase.call();
        res.fold((l) {
          emit(state.copyWith(type: ScreenType.failures, failures: l));
        },
            (r) => {
                  emit(state.copyWith(
                      type: ScreenType.success, movies: r.results))
                });
      } else if (event is HomeGetNewReleasesMovie) {
        emit(state.copyWith(type: ScreenType.loading));
        var res = await getNewReleasesMovieUseCase.call();
        res.fold((l) {
          emit(state.copyWith(type: ScreenType.failures, failures: l));
        },
            (r) => {
                  emit(state.copyWith(
                      type: ScreenType.success, movies: r.results))
                });
      } else if (event is HomeGetRecommendedMovie) {
        emit(state.copyWith(type: ScreenType.loading));
        var res = await getRecommendedMovieUseCase.call();
        res.fold((l) {
          emit(state.copyWith(type: ScreenType.failures, failures: l));
        },
            (r) => {
                  emit(state.copyWith(
                      type: ScreenType.success, movies: r.results))
                });
      } else if (event is HomeChangeNavBarEvent) {
        index = event.index;
        emit(state.copyWith(type: ScreenType.changeNavBar));
      }
    });
  }
}
