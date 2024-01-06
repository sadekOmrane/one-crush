// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/core/styles/app_colors.dart';
import 'package:mobile/core/styles/app_text_style.dart';

class AppPrimaryButtonWidget extends StatelessWidget {
  Function? onPress;
  String label;
  Icon? icon;
  AppPrimaryButtonWidget({
    Key? key,
    this.onPress,
    required this.label,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress as void Function()?,
      child: Text(
        label,
        style: AppTextStyle.primaryTextWhite16Meduim,
      ),
      style: ElevatedButton.styleFrom(
          foregroundColor: AppColors.primaryBg,
          backgroundColor: AppColors.primary,
          disabledBackgroundColor: AppColors.primary,
          disabledForegroundColor: AppColors.primaryBg,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.sp),
          ),
          padding: EdgeInsets.all(10.sp)),
    );
  }
}
