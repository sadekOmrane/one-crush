// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/core/styles/app_text_style.dart';
import 'package:mobile/features/auth/domain/entities/user_entity.dart';

class AppSwiperCardWidget extends StatelessWidget {
  UserEntity user;
  AppSwiperCardWidget({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.sp),
        color: Colors.white,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRROt7YUKa7excpJt4CR59ZwHzhWDfV1mr0eQ&usqp=CAU'),
        ),
      ),
      padding: EdgeInsets.all(20.sp),
      width: double.maxFinite,
      height: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            user.name ?? 'Full Name',
            style: AppTextStyle.primaryTextWhite16Bold,
          ),
          SizedBox(
            height: 10.sp,
          ),
          Text(
            user.email ?? 'Email',
            style: AppTextStyle.primaryTextWhite14Meduim,
          ),
          SizedBox(
            height: 10.sp,
          ),
          Text(
            'Hobies..',
            style: AppTextStyle.primaryTextWhite12Regular,
          ),
        ],
      ),
    );
  }
}
