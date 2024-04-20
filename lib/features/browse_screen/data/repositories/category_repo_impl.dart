import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/features/browse_screen/data/data_sources/category_ds.dart';
import 'package:movies_app/features/browse_screen/data/models/CategoryModel.dart';
import 'package:movies_app/features/browse_screen/domain/repositories/category_repo.dart';

class CategoryRepoImpl implements CategoryRepo{

  CategoryDS categoryDS;
  CategoryRepoImpl( this.categoryDS);


  @override
  Future<Either<Failures, CategoryModel>> getCategories() async{
    try{
      var result = await categoryDS.getCategories();
      return Right(result);
    }catch(error){
      print(error.toString());
      return Left(RemoteFailure(error.toString()));
    }
  }
}