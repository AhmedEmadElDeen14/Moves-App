import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItem extends StatelessWidget {
  String name;
  String image;

  CategoryItem({super.key, required this.name,required this.image});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18.r),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              image,
              width: 200.sw,
              height: 110.sh,
              fit: BoxFit.fill,
            ),
             Text(
              name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
      ),
    );
  }
}
