import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movies_app/config/routes/routes.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/app_images.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    Timer(Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(context, RoutesName.navBar, (route) => false);
    });

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Stack(
        children: [
          const Center(child: Image(image: AssetImage(AppImages.logo))),
          const Align(
            alignment: Alignment.bottomCenter,
            child: Image(
              image: AssetImage(
                AppImages.routeLogo,
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            margin: const EdgeInsets.symmetric(vertical: 20),
            child:  Text(
              "supervised by Mohamed Hamoda",
              style: TextStyle(
                color: AppColors.selectedIconColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
