part of 'categories_bloc.dart';


class GetCategoriesState {
  ScreenType? status;
  CategoryModel? categoryModel;
  Failures? failures;

  GetCategoriesState({this.status, this.categoryModel, this.failures});

  GetCategoriesState copyWith({
    ScreenType? status,
    Failures? failures,
    CategoryModel? categoryModel,
  }) {
    return GetCategoriesState(
      status: status ?? this.status,
      failures: failures ?? this.failures,
      categoryModel: categoryModel ?? this.categoryModel,
    );
  }
}


class GetCategoriesInitState extends GetCategoriesState {
  GetCategoriesInitState() : super(status: ScreenType.init);
}
