part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}

class GetSearchEvent extends SearchEvent{
  final String? movieName;

  GetSearchEvent({this.movieName});
}
