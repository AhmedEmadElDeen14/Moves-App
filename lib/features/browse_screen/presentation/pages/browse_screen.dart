import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/api/api_manager.dart';
import 'package:movies_app/core/utils/app_images.dart';
import 'package:movies_app/features/browse_screen/data/data_sources/category_ds_impl.dart';
import 'package:movies_app/features/browse_screen/data/models/CategoryModel.dart';
import 'package:movies_app/features/browse_screen/data/repositories/category_repo_impl.dart';
import 'package:movies_app/features/browse_screen/domain/use_cases/get_categories_usecase.dart';
import '../../../../core/enum/screen_state.dart';
import '../../../../core/utils/app_colors.dart';
import '../bloc/categories_bloc.dart';
import '../widgets/category_item.dart';

class BrowseScreen extends StatelessWidget {
   BrowseScreen({super.key});

   List<Genres> genresList = [];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      CategoriesBloc(
        getCategoryUseCase: GetCategoryUseCase(
          CategoryRepoImpl(
            CategoryDSImpl(
              ApiManager(),
            ),
          ),
        ),
      )
        ..add(GetCategoriesEvent()),
      child: BlocConsumer<CategoriesBloc, GetCategoriesState>(
        listener: (context, state) {
          if (state.status == ScreenType.success) {
            genresList = state.categoryModel!.genres!.cast<Genres>();
          }
          else if(state.status == ScreenType.failures){
            print("Failure!!!!!!");
          }
        },
        builder: (context, state) {
          return ScreenUtilInit(
            child: state.status == ScreenType.loading
                ? Center(
              child: CircularProgressIndicator(color: AppColors.selectedBookmarkColor,),
            )
                : Padding(
              padding: EdgeInsets.symmetric(vertical: 32.0.h, horizontal: 18.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                    "Browse Category",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 22.0.sp,
                    ),
                  ),
                   SizedBox(
                    height: 12.0.h,
                  ),
                  Flexible(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 18.w,
                        mainAxisSpacing: 18.h,
                        childAspectRatio: 1.5,
                      ),
                      itemBuilder: (context, index) =>
                          CategoryItem(
                            image: AppImages.categoriesList[index],
                            name: genresList[index].name!,//state.categoryModel?.genres?[index].name ?? "null",
                          ),
                      itemCount: genresList.length,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
