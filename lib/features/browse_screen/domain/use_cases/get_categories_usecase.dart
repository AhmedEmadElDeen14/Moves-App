import 'package:dartz/dartz.dart';
import 'package:movies_app/features/browse_screen/domain/repositories/category_repo.dart';

import '../../../../core/errors/failure.dart';
import '../../data/models/CategoryModel.dart';

class GetCategoryUseCase {
  CategoryRepo categoryRepo;

  GetCategoryUseCase( this.categoryRepo);

  Future<Either<Failures, CategoryModel>> call() =>
      categoryRepo.getCategories();
}
