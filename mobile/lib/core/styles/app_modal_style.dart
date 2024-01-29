import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/core/styles/app_colors.dart';

class AppModalStyle {
  static bottomModalSheetStyle(
      BuildContext context, Widget Function(BuildContext) builder) {
    showModalBottomSheet(
      isScrollControlled: true,
      showDragHandle: true,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: AppColors.primaryBr),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.sp), topRight: Radius.circular(12.sp)),
      ),
      context: context,
      builder: builder,
    );
  }

  static dialogModalStyle(BuildContext context, Widget child) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: AppColors.primaryBg,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.sp),
          ),
          child: Container(
            padding: EdgeInsets.all(30.sp),
            child: child,
          ),
        );
      },
    );
  }
}
