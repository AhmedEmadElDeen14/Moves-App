import 'package:flutter/material.dart';

@immutable
abstract class MovieDetailsEvent {}

class MovieDetailsGetMovie extends MovieDetailsEvent {}

class MovieDetailsGetSimilarMovies extends MovieDetailsEvent {}
