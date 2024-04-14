import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/features/browse_screen/data/models/CategoryModel.dart';


abstract class CategoryRepo{
  Future<Either<Failures,CategoryModel>> getCategories();

}