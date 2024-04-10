import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/features/home_screen/presentation/pages/home_screen.dart';

class NavBarLayout extends StatelessWidget {
  NavBarLayout({super.key});

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          index = value;
        },
        iconSize: 25,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.rectangleBackgroundColor,
        currentIndex: index,
        selectedItemColor: AppColors.selectedIconColor,
        unselectedItemColor: AppColors.unselectedIconColor,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: "Browse"),
          BottomNavigationBarItem(
              icon: Icon(Icons.collections_bookmark), label: "Watchlist"),
        ],
      ),

      body: tabs[index],
    );
  }

  List<Widget> tabs =[
    HomeScreen(),
  ];
}
