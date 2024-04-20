

import 'package:movies_app/core/api/api_manager.dart';
import 'package:movies_app/core/api/end_points.dart';
import 'package:movies_app/features/search_screen/data/models/MovieSearchModel.dart';

import 'movie_search_remote_ds.dart';

class MovieSearchRemoteDSImpl implements MovieSearchRemoteDS {
  MovieSearchRemoteDSImpl(ApiManager apiManager);

  @override
  Future<MovieSearchModel> getMovieSearch(String movieName) async {
    ApiManager apiManager = ApiManager();
    var response = await apiManager.getData(
      endPoint: EndPoints.search,
      query: {'query': movieName},
    );
    MovieSearchModel movieSearchModel =
        MovieSearchModel.fromJson(response.data);
    print("Data: ${movieSearchModel.results}");
    return movieSearchModel;
  }
}

/*
@override
  Future<Either<Failures, MovieSearchModel>> getMovieSearch(String movieName) async {
    try {
      Response response = await apiManager.getData(
        endPoint: '${EndPoints.search}/$movieName',);
      MovieSearchModel model = MovieSearchModel.fromJson(response.data);
      return Right(model);
    }catch (e){
      return left(RemoteFailure(e.toString()));
    }
    }
 */
