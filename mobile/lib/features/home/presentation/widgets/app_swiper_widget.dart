import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:mobile/core/styles/app_colors.dart';
import 'package:mobile/core/widgets/app_message_error_widget.dart';
import 'package:mobile/features/auth/domain/entities/user_entity.dart';
import 'package:mobile/features/home/presentation/blocs/remote/get_users/get_users_bloc.dart';
import 'package:mobile/features/home/presentation/blocs/remote/matching/matching_bloc.dart';
import 'package:mobile/features/home/presentation/widgets/app_swiper_card_widget.dart';

class AppSwiperWidget extends StatefulWidget {
  const AppSwiperWidget({super.key});

  @override
  State<AppSwiperWidget> createState() => _AppSwiperWidgetState();
}

class _AppSwiperWidgetState extends State<AppSwiperWidget> {
  List<UserEntity>? users;
  String swipeDirection = '';
  final AppinioSwiperController controller = AppinioSwiperController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<GetUsersBloc>(context).add(GetUsers());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildSwiper(),
        SizedBox(height: 40.sp),
        _buildButtonsBar(),
      ],
    );
  }

  Widget _buildSwiper() {
    return BlocBuilder<GetUsersBloc, GetUsersState>(
      builder: (context, state) {
        if (state is GetUsersLoaded) {
          users = state.users;
          return Container(
            height: MediaQuery.of(context).size.height * .6,
            child: AppinioSwiper(
              invertAngleOnBottomDrag: true,
              backgroundCardCount: 2,
              swipeOptions: const SwipeOptions.all(),
              controller: controller,
              onSwipeEnd: _swipeEnd,
              onEnd: _onEnd,
              cardCount: users!.length,
              cardBuilder: (BuildContext context, int index) {
                return AppSwiperCardWidget(
                  user: users![index],
                );
              },
            ),
          );
        } else if (state is GetUsersError) {
          return AppMessageErrorWidget(error: state.error);
        } else if (state is GetUsersLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Container();
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
            onPressed: () {
              controller.swipeLeft();
            },
            child: Icon(Bootstrap.x_lg),
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(side: BorderSide(color: AppColors.danger)),
              padding: EdgeInsets.all(10),
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent, // <-- Button color
              foregroundColor: AppColors.danger, // <-- Splash color
            ),
          ),
          ElevatedButton(
            onPressed: () {
              controller.swipeDown();
            },
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
            onPressed: () {
              controller.swipeUp();
            },
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
            onPressed: () {
              controller.swipeRight();
            },
            child: Icon(Bootstrap.heart),
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(side: BorderSide(color: AppColors.primary)),
              padding: EdgeInsets.all(10),
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent, // <-- Button color
              foregroundColor: AppColors.primary, // <-- Splash color
            ),
          ),
        ],
      ),
    );
  }

  void _swipeEnd(int previousIndex, int targetIndex, SwiperActivity activity) {
    switch (activity) {
      case Swipe():
        print('The card was swiped to the : ${activity.direction.name}');
        print('previous index: $previousIndex, target index: $targetIndex');
        match(activity.direction.name, users![previousIndex].id!);
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

  void match(String direction, int userId) {
    switch (direction) {
      case 'left':
        BlocProvider.of<MatchingBloc>(context)
            .add(Match(id: userId, type: 'dislike'));
        break;
      case 'right':
        BlocProvider.of<MatchingBloc>(context)
            .add(Match(id: userId, type: 'love'));
        break;
      case 'up':
        BlocProvider.of<MatchingBloc>(context)
            .add(Match(id: userId, type: 'star'));
        break;
      case 'down':
        BlocProvider.of<MatchingBloc>(context)
            .add(Match(id: userId, type: 'like'));
        break;
    }
  }
}
