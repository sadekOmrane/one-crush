import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/core/styles/app_colors.dart';

class AppMenuStyle {
  static menu(BuildContext context, List<PopupMenuEntry<dynamic>> items) {
    showMenu(
      shape: RoundedRectangleBorder(
        side: const BorderSide(
          color: AppColors.primaryBr,
        ),
        borderRadius: BorderRadius.circular(12.sp),
      ),
      context: context,
      position: RelativeRect.fromLTRB(100.sp, 100.sp, 0, 100.sp),
      shadowColor: AppColors.shGrey,
      items: items,
    );
  }
}
