import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/core/injection/dependency_injection.dart';
import 'package:mobile/core/router/app_router_generator.dart';
import 'package:mobile/core/router/app_routes.dart';
import 'package:mobile/core/styles/app_colors.dart';

void main() async {
  await initDepInjection();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRouterGenerator.generateRoute,
          initialRoute: AppRoutes.APP_LOGIN_SCREEN,
          theme: ThemeData(
              fontFamily: 'Poppins',
              scaffoldBackgroundColor: Colors.white,
              colorScheme: const ColorScheme.light(
                primary: AppColors.primary,
                secondary: AppColors.secondary,
                background: Colors.white,
              )),
        );
      },
    );
  }
}
