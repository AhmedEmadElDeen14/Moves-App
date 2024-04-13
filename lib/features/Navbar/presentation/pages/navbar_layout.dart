import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/features/browse_screen/presentatoin/pages/browse_screen.dart';
import 'package:movies_app/features/home_screen/presentation/pages/home_screen.dart';
import 'package:movies_app/features/search_screen/presentatoin/pages/search_screen.dart';
import 'package:movies_app/features/watchlist_screen/presentation/pages/watchlist_screen.dart';

class NavBarLayout extends StatefulWidget {
  NavBarLayout({super.key});

  @override
  State<NavBarLayout> createState() => _NavBarLayoutState();
}

class _NavBarLayoutState extends State<NavBarLayout> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        iconSize: 25,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.rectangleBackgroundColor,
        currentIndex: index,
        selectedItemColor: AppColors.selectedIconColor,
        unselectedItemColor: AppColors.unselectedIconColor,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        items: const [
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
    SearchScreen(),
    BrowseScreen(),
    WatchlistScreen()
  ];
}
