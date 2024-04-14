import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/constants.dart';
import 'package:movies_app/features/home_screen/data/models/MoviesModel.dart';

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
    return Container(
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
              widget.result?.posterPath == null ||
                      widget.result?.posterPath?.isEmpty == true
                  ? const Image(image: AssetImage("assets/images/movie.png"))
                  : Image(
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
                        ? const Icon(
                            Icons.check,
                            size: 20,
                            color: Colors.white,
                          )
                        : const Icon(
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
                      const SizedBox(
                        width: 7,
                      ),
                      Text(
                        "${widget.result?.voteAverage.toString().substring(0, 3)}",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  widget.result!.title.toString().length > 25
                      ? Text(
                          widget.result?.title ?? "",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 9,
                              fontWeight: FontWeight.w500),
                        )
                      : Text(
                          widget.result?.title ?? "",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                  Text(
                    "${widget.result?.releaseDate == null || widget.result?.releaseDate == "" ? 2021 : widget.result?.releaseDate.toString().substring(0, 4)}  R 1h 59m",
                    style: const TextStyle(
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
  }
}
