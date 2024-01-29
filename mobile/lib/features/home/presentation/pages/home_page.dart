import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/core/styles/app_global.dart';
import 'package:mobile/features/home/presentation/widgets/app_nav_bar_widget.dart';
import 'package:mobile/features/home/presentation/widgets/app_swiper_widget.dart';

class HomePages extends StatefulWidget {
  const HomePages({super.key});

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: BoxDecoration(
            gradient: AppGlobal.bgGradient,
          ),
          padding: EdgeInsets.all(30.sp),
          child: SingleChildScrollView(
            child: Column(
              children: [
                AppNavBarWidget(),
                AppSwiperWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
