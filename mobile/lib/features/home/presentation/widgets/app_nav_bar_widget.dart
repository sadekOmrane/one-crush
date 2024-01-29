import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:mobile/core/router/app_routes.dart';
import 'package:mobile/core/styles/app_colors.dart';
import 'package:mobile/features/auth/presentation/widgets/app_logo_widget.dart';

class AppNavBarWidget extends StatelessWidget {
  const AppNavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.APP_ACCOUNT_SCREEN);
          },
          child: Icon(
            Bootstrap.person_circle,
            size: 24.sp,
          ),
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            padding: EdgeInsets.all(10.sp),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent, // <-- Button color
            foregroundColor: AppColors.primaryBg, // <-- Splash color
          ),
        ),
        AppLogoWidget(),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.APP_LOGIN_SCREEN);
          },
          child: Icon(
            Bootstrap.chat_dots,
            size: 24.sp,
          ),
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            padding: EdgeInsets.all(10.sp),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent, // <-- Button color
            foregroundColor: AppColors.primaryBg, // <-- Splash color
          ),
        ),
      ],
    );
  }
}
