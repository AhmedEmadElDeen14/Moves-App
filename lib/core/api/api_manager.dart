import 'package:dio/dio.dart';
import 'package:movies_app/core/utils/constants.dart';
import 'package:movies_app/features/home_screen/data/models/MoviesModel.dart';

class ApiManager {
  late Dio dio;

  ApiManager() {
    dio = Dio();
  }

  Future<Response> getData(
      {required String endPoint, Map<String, dynamic>? data}) {

    dio.options.headers['Authorization']= Constants.authorization;

    return dio.get(Constants.baseURl + endPoint, queryParameters: data);
  }
}
