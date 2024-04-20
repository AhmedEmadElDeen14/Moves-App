import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/features/search_screen/data/models/MovieSearchModel.dart';

import '../../../../core/enum/screen_state.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/use_cases/get_movie_search_use_case.dart';

part 'search_event.dart';

part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  GetMovieSearchUseCase getMovieSearchUseCase;
  //String? movieName;

  SearchBloc({required this.getMovieSearchUseCase, /*this.movieName*/})
      : super(
          const SearchInitState(),
        ) {
    on<GetSearchEvent>((event, emit) async {
      emit(state.copyWith(
        type: ScreenType.loading,
      ));
      var result = await getMovieSearchUseCase.call(event.movieName);
      result.fold((l) {
        emit(state.copyWith(type: ScreenType.failures, failures: l));
      }, (r) {
        emit(state.copyWith(type: ScreenType.success, movie: r));
      });
    });
  }
}
