import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/features/search_screen/data/models/MovieSearchModel.dart';
import '../../domain/repositories/movie_search_repo.dart';
import '../data_sources/movie_search_remote_ds.dart';


class MovieSearchRepoImpl implements MovieSearchRepo{

  MovieSearchRemoteDS movieSearchRemoteDS;

  MovieSearchRepoImpl(this.movieSearchRemoteDS);

  @override
  Future<Either<Failures, MovieSearchModel>> getMovieSearch(String movieName) async{
    //return movieSearchRemoteDS.getMovieSearch(movieName);
    try{
      var result =await movieSearchRemoteDS.getMovieSearch(movieName);
      return Right(result);
    }catch(error){
      print(error.toString());
      return Left(RemoteFailure(error.toString()));
    }
  }

}