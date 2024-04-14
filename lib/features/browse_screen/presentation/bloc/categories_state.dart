part of 'categories_bloc.dart';

@immutable
class CategoriesState {
  ScreenType? status;
  CategoryModel? categoryModel;
  Failures? failures;

  CategoriesState({this.status, this.categoryModel, this.failures});

  CategoriesState copyWith({
    ScreenType? status,
    Failures? failures,
    CategoryModel? categoryModel,
  }) {
    return CategoriesState(
      status: status ?? this.status,
      failures: failures ?? this.failures,
      categoryModel: categoryModel ?? this.categoryModel,
    );
  }
}

class CategoriesInitState extends CategoriesState{
  CategoriesInitState() : super(status: ScreenType.init);
}
