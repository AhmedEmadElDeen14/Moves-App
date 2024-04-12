import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';

class GenresButton extends StatelessWidget {

  String Genre;

  GenresButton({super.key,required this.Genre});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 65.w,
      padding: EdgeInsets.symmetric(
        vertical: 3,
        horizontal: 15
      ),
      margin: EdgeInsets.only(
        top: 3,
        bottom: 3,
        right: 6
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: AppColors.unselectedBookmarkColor
        )
      ),
      child: Text(
        Genre,
        style: TextStyle(
          color: Colors.white,
          fontSize: 10,
        ),
      ),
    );
  }
}
