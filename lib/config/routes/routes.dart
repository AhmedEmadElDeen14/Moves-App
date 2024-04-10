import 'package:flutter/material.dart';
import 'package:movies_app/features/Navbar/presentation/pages/navbar_layout.dart';
import 'package:movies_app/features/movie_details/presentation/pages/movies_details.dart';
import 'package:movies_app/features/splash_scren/presentation/pages/splach_screen.dart';

class RoutesName {
  static const String splash = "/";
  static const String navBar = "navBar";
  static const String movieDetails = "movieDetails";
}

class AppRoutes {

  static Route onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case RoutesName.navBar:
        return MaterialPageRoute(
          builder: (context) => NavBarLayout(),
        );
      case RoutesName.movieDetails:
        return MaterialPageRoute(
          builder: (context) => MovieDetails(movieId: settings.arguments as String,),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => unDefineRoute(),
        );
    }
  }

  static Widget unDefineRoute() {
    return const Scaffold(
      body: Center(child: Text("Route Not Found")),
    );
  }
}
