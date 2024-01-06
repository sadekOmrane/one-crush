import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/core/styles/app_colors.dart';
import 'package:mobile/core/styles/app_text_style.dart';

class AppSocialLoginWidget extends StatelessWidget {
  Function? onPress;
  String label;
  Icon? icon;
  AppSocialLoginWidget({
    Key? key,
    this.onPress,
    required this.label,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress as void Function()?,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon ?? SizedBox(),
          SizedBox(
            width: 5.sp,
          ),
          Text(
            label,
            style: AppTextStyle.primaryTextBlack14Regular,
          ),
        ],
      ),
      style: ElevatedButton.styleFrom(
          foregroundColor: AppColors.primaryText,
          backgroundColor: Colors.transparent,
          disabledBackgroundColor: Colors.transparent,
          disabledForegroundColor: AppColors.primaryText,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.sp),
            side: BorderSide(color: AppColors.primaryBr, width: 2),
          ),
          padding: EdgeInsets.all(10.sp)),
    );
  }
}
