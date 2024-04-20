import 'package:movies_app/core/api/api_manager.dart';
import 'package:movies_app/core/api/end_points.dart';
import 'package:movies_app/features/browse_screen/data/data_sources/category_ds.dart';
import 'package:movies_app/features/browse_screen/data/models/CategoryModel.dart';

class CategoryDSImpl implements CategoryDS {
  CategoryDSImpl(ApiManager apiManager);

  @override
  Future<CategoryModel> getCategories() async {
    ApiManager apiManager = ApiManager();

    var response = await apiManager.getData(endPoint: EndPoints.categories);

    CategoryModel categoryModel = CategoryModel.fromJson(response.data);

    return categoryModel;
  }
}
