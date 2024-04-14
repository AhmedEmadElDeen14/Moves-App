import '../models/CategoryModel.dart';

abstract class CategoryDS {

  Future<CategoryModel> getCategories();

}
