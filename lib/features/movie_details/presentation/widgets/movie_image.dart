import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/constants.dart';
import 'package:movies_app/features/home_screen/data/models/MoviesModel.dart';
import 'package:movies_app/features/home_screen/presentation/bloc/home_bloc.dart';
import 'package:movies_app/features/home_screen/presentation/bloc/home_state.dart';
import 'package:movies_app/features/movie_details/data/models/movie_model.dart';
import 'package:movies_app/features/movie_details/presentation/bloc/movie_details_bloc.dart';
import 'package:movies_app/features/movie_details/presentation/bloc/movie_details_state.dart';

class MovieImage extends StatefulWidget {
  MovieImage({super.key, this.result});

  MovieModel? result;

  @override
  State<MovieImage> createState() => _MovieCoverImageState();
}

class _MovieCoverImageState extends State<MovieImage> {
  bool bookmarkSelected = false;
  late bool checkSection;

  @override
  Widget build(BuildContext context) {
    return Stack(
            children: [
              Image(
                image: NetworkImage(
                    "${Constants.imgUrl}${widget.result?.posterPath}"),
                height: 199.h,
              ),
              InkWell(
                onTap: () {
                  if (bookmarkSelected == true) {
                    bookmarkSelected = false;
                  } else {
                    bookmarkSelected = true;
                  }
                  setState(() {});
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Icon(
                      Icons.bookmark,
                      color: bookmarkSelected
                          ? AppColors.selectedBookmarkColor
                          : AppColors.unselectedBookmarkColor,
                      size: 50,
                    ),
                    bookmarkSelected
                        ? Icon(
                            Icons.check,
                            size: 20,
                            color: Colors.white,
                          )
                        : Icon(
                            Icons.add,
                            size: 20,
                            color: Colors.white,
                          ),
                  ],
                ),
              ),
            ],
          );
  }
}
