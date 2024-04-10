import 'package:flutter/material.dart';

@immutable
abstract class HomeEvent {}

class HomeGetPopularMovie extends HomeEvent {}

class HomeGetNewReleasesMovie extends HomeEvent {}

class HomeGetRecommendedMovie extends HomeEvent {}

class HomeGetMovieDetails extends HomeEvent {}

class HomeChangeNavBarEvent extends HomeEvent {
  int index;

  HomeChangeNavBarEvent(this.index);
}
