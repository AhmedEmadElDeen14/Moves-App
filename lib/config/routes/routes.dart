import 'package:flutter/material.dart';
import 'package:movies_app/features/splash_scren/presentation/pages/splach_screen.dart';

class RoutesName {

  static const String splash = "/";

}

class AppRoutes {

  static Route onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(builder: (context) => SplashScreen(),);


      default :
        return MaterialPageRoute(builder: (context) => unDefineRoute(),);
    }
  }

  static Widget unDefineRoute(){
    return const Scaffold(
      body: Center(child: Text("Route Not Found")),
    );
  }

}