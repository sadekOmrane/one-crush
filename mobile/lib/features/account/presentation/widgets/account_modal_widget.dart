import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:mobile/core/router/app_routes.dart';
import 'package:mobile/core/styles/app_colors.dart';
import 'package:mobile/core/styles/app_text_style.dart';
import 'package:mobile/core/widgets/app_message_error_widget.dart';
import 'package:mobile/features/auth/presentation/blocs/remote/auth/auth_bloc.dart';

class AccountModalWidget extends StatelessWidget {
  const AccountModalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 40.w,
      height: MediaQuery.of(context).size.height * .6,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildListTile(Bootstrap.person, 'Edit Profile', () {}),
          _buildListTile(Bootstrap.chat, 'Messages', () {}),
          _buildListTile(Bootstrap.heart, 'Matches', () {}),
          _buildListTile(Bootstrap.gear, 'Settings', () {}),
          _buildListTile(Bootstrap.info_circle, 'About', () {}),
          _buildListTile(Bootstrap.question_circle, 'Help', () {}),
          SizedBox(height: 20.sp),
          ElevatedButton(
            onPressed: () {
              BlocProvider.of<AuthBloc>(context).add(Logout());
            },
            child: Text(
              'Logout',
              style: AppTextStyle.primaryTextWhite16Meduim,
            ),
            style: ElevatedButton.styleFrom(
                foregroundColor: AppColors.primaryBg,
                backgroundColor: AppColors.danger,
                disabledBackgroundColor: AppColors.primary,
                disabledForegroundColor: AppColors.primaryBg,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.sp),
                ),
                padding: EdgeInsets.all(10.sp)),
          ),
          SizedBox(height: 20.sp),
          BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is LogedOut) {
                Navigator.pushNamedAndRemoveUntil(
                    context, AppRoutes.APP_LOGIN_SCREEN, (route) => false);
              }
            },
            builder: (context, state) {
              if (state is LogoutLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is LogoutError) {
                return AppMessageErrorWidget(error: state.error);
              }

              return SizedBox();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildListTile(icon, title, onTap) {
    return ListTile(
      leading: Icon(
        icon,
        size: 24.sp,
      ),
      title: Text(
        title,
        style: AppTextStyle.primaryTextBlack16Regular,
      ),
      trailing: Icon(
        Bootstrap.chevron_right,
        size: 24.sp,
      ),
      onTap: onTap,
    );
  }
}
