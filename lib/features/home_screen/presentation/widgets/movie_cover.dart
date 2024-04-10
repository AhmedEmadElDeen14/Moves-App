import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/constants.dart';
import 'package:movies_app/features/home_screen/data/models/MoviesModel.dart';
import 'package:movies_app/features/home_screen/presentation/bloc/home_bloc.dart';
import 'package:movies_app/features/home_screen/presentation/bloc/home_state.dart';

class MovieCoverImage extends StatefulWidget {
  MovieCoverImage({super.key, required this.result});

  Results? result;

  @override
  State<MovieCoverImage> createState() => _MovieCoverImageState();
}

class _MovieCoverImageState extends State<MovieCoverImage> {
  bool bookmarkSelected = false;
  late bool checkSection;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state.type == ScreenType.failures) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("Error 01"),
              content: Text(state.failures?.message ?? ""),
            ),
          );
        }
      },
      builder: (context, state) {
        return state.type == ScreenType.loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                decoration: BoxDecoration(
                  color: AppColors.unselectedBookmarkColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                // height: 184.h,
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.topLeft,
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
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(3),
                        width: 97.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: AppColors.selectedBookmarkColor,
                                  size: 10,
                                ),
                                SizedBox(
                                  width: 7,
                                ),
                                Text(
                                  "${widget.result?.voteAverage.toString().substring(0, 3)}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            widget.result!.title.toString().length > 30
                                ? Text(
                                    widget.result?.title ?? "",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 9,
                                        fontWeight: FontWeight.w500),
                                  )
                                : Text(
                                    widget.result?.title ?? "",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                            Text(
                              "${widget.result?.releaseDate.toString().substring(0, 4)}  R 1h 59m",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }
}
