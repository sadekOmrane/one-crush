import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
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
          onPressed: () {},
          child: Icon(Bootstrap.person_circle),
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            padding: EdgeInsets.all(8.sp),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent, // <-- Button color
            foregroundColor: AppColors.primaryBg, // <-- Splash color
          ),
        ),
        AppLogoWidget(),
        ElevatedButton(
          onPressed: () {},
          child: Icon(Bootstrap.chat_dots),
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            padding: EdgeInsets.all(8.sp),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent, // <-- Button color
            foregroundColor: AppColors.primaryBg, // <-- Splash color
          ),
        ),
      ],
    );
  }
}
