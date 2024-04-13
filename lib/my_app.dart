import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/config/routes/routes.dart';
import 'package:movies_app/features/Navbar/presentation/pages/navbar_layout.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 892),
      builder: (_, child) {

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: (settings) => AppRoutes.onGenerate(settings),
          home: NavBarLayout(),
        );
      },
    );
  }
}
