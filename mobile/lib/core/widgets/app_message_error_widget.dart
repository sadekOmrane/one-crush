import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/core/styles/app_colors.dart';
import 'package:mobile/core/styles/app_text_style.dart';

class AppMessageErrorWidget extends StatefulWidget {
  DioException? error;
  AppMessageErrorWidget({
    Key? key,
    this.error,
  }) : super(key: key);

  @override
  State<AppMessageErrorWidget> createState() => _AppMessageErrorWidgetState();
}

class _AppMessageErrorWidgetState extends State<AppMessageErrorWidget> {
  String? message;
  @override
  void initState() {
    super.initState();
    message = widget.error?.response?.data['message'] ?? widget.error?.message;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.sp),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.danger),
        borderRadius: BorderRadius.circular(10.sp),
      ),
      child: Text(
        message ?? 'Error',
        textAlign: TextAlign.center,
        style: AppTextStyle.dangerText14Regular,
      ),
    );
  }
}
