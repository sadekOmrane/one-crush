import 'dart:math';

import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:mobile/core/styles/app_colors.dart';
import 'package:mobile/core/styles/app_global.dart';
import 'package:mobile/core/widgets/app_message_error_widget.dart';
import 'package:mobile/features/auth/presentation/widgets/app_logo_widget.dart';
import 'package:mobile/features/home/presentation/blocs/remote/get_users/get_users_bloc.dart';
import 'package:mobile/features/home/presentation/widgets/app_swiper_card_widget.dart';

class HomePages extends StatefulWidget {
  const HomePages({super.key});

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  final AppinioSwiperController controller = AppinioSwiperController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<GetUsersBloc>(context).add(GetUsers());
  }

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
                AppLogoWidget(),
                _buildSwiper(),
                SizedBox(
                  height: 40.sp,
                ),
                _buildButtonsBar(),
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }

  Widget _buildSwiper() {
    return BlocBuilder<GetUsersBloc, GetUsersState>(
      builder: (context, state) {
        if (state is GetUsersLoaded) {
          return Container(
            height: MediaQuery.of(context).size.height * .6,
            child: AppinioSwiper(
              invertAngleOnBottomDrag: true,
              backgroundCardCount: 2,
              swipeOptions: const SwipeOptions.all(),
              controller: controller,
              onCardPositionChanged: (
                SwiperPosition position,
              ) {
                //debugPrint('${position.offset.toAxisDirection()}, '
                //    '${position.offset}, '
                //    '${position.angle}');
              },
              onSwipeEnd: _swipeEnd,
              onEnd: _onEnd,
              cardCount: state.users!.length,
              cardBuilder: (BuildContext context, int index) {
                return AppSwiperCardWidget(
                  user: state.users![index],
                );
              },
            ),
          );
        } else if (state is GetUsersError) {
          return AppMessageErrorWidget(
            message: state.error!.message,
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _buildButtonsBar() {
    return Container(
      padding: EdgeInsets.all(10.sp),
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.sp),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {},
            child: Icon(Bootstrap.heart),
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(side: BorderSide(color: AppColors.primary)),
              padding: EdgeInsets.all(10),
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent, // <-- Button color
              foregroundColor: AppColors.primary, // <-- Splash color
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Icon(Bootstrap.hand_thumbs_up),
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(side: BorderSide(color: AppColors.blue)),
              padding: EdgeInsets.all(10),
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent, // <-- Button color
              foregroundColor: AppColors.blue, // <-- Splash color
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Icon(Bootstrap.star),
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(side: BorderSide(color: AppColors.warning)),
              padding: EdgeInsets.all(10),
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent, // <-- Button color
              foregroundColor: AppColors.warning, // <-- Splash color
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Icon(Bootstrap.x_lg),
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(side: BorderSide(color: AppColors.danger)),
              padding: EdgeInsets.all(10),
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent, // <-- Button color
              foregroundColor: AppColors.danger, // <-- Splash color
            ),
          ),
        ],
      ),
    );
  }

  void _swipeEnd(int previousIndex, int targetIndex, SwiperActivity activity) {
    switch (activity) {
      case Swipe():
        print('The card was swiped to the : ${activity.direction}');
        print('previous index: $previousIndex, target index: $targetIndex');
        break;
      case Unswipe():
        print('A ${activity.direction.name} swipe was undone.');
        print('previous index: $previousIndex, target index: $targetIndex');
        break;
      case CancelSwipe():
        print('A swipe was cancelled');
        break;
      case DrivenActivity():
        print('Driven Activity');
        break;
    }
  }

  void _onEnd() {
    print('end reached!');
  }
}
