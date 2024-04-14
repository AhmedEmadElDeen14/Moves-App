part of 'search_bloc.dart';

@immutable
class SearchState {

  final ScreenType? type;
  final Failures? failures;
  final MovieSearchModel? movie;
  final List<Results>? movies;

  const SearchState({this.type, this.failures, this.movie, this.movies});

  SearchState copyWith(
      {
        ScreenType? type,
        Failures? failures,
        MovieSearchModel? movie,
        List<Results>? movies}) {
    return SearchState(
        type: type ?? this.type,
        failures: failures ?? this.failures,
        movie: movie ?? this.movie,
        movies: movies ?? this.movies);
  }
}

class SearchInitState extends SearchState {
  const SearchInitState() : super(type: ScreenType.init);
}
