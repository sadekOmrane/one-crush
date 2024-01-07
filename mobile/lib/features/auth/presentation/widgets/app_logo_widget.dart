import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppLogoWidget extends StatelessWidget {
  const AppLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180.sp,
      padding: EdgeInsets.only(bottom: 10.sp),
      child: Image.asset('assets/images/logo.png'),
    );
  }
}
