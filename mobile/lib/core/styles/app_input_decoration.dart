import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/core/styles/app_colors.dart';
import 'package:mobile/core/styles/app_text_style.dart';

class AppInputDecoration {
  static InputDecoration inputDecoration(
      [String? label, String? hint, Widget? prefixIcon, Widget? suffixIcon]) {
    return InputDecoration(
      label: Text(
        label ?? '',
        style: AppTextStyle.secondaryText14Regular,
      ),
      hintText: hint,
      contentPadding: EdgeInsets.symmetric(
        horizontal: 16.sp,
        vertical: 12.sp,
      ),
      fillColor: AppColors.primaryBg,
      filled: true,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primary),
        borderRadius: BorderRadius.circular(12.sp),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.primaryBg),
        borderRadius: BorderRadius.circular(12.sp),
      ),
      prefixIcon: prefixIcon,
      prefixIconColor: AppColors.secondaryText,
      suffixIcon: suffixIcon,
      suffixIconColor: AppColors.secondaryText,
    );
  }
}
