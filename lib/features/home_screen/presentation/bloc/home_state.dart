import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/features/home_screen/data/models/MoviesModel.dart';

enum ScreenType { init, loading, success, failures, changeNavBar }

class HomeState {
  ScreenType? type;
  Failures? failures;
  List<Results>? movies;

  HomeState({this.type, this.failures, this.movies});

  HomeState copyWith(
      {ScreenType? type, Failures? failures, List<Results>? movies}) {
    return HomeState(
        type: type ?? this.type,
        failures: failures ?? this.failures,
        movies: movies ?? this.movies);
  }
}

class HomeInitial extends HomeState {
  HomeInitial() : super(type: ScreenType.init);
}
