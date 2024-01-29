import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:mobile/core/styles/app_colors.dart';
import 'package:mobile/core/styles/app_global.dart';
import 'package:mobile/core/styles/app_modal_style.dart';
import 'package:mobile/core/styles/app_text_style.dart';
import 'package:mobile/features/account/presentation/widgets/account_modal_widget.dart';
import 'package:mobile/features/account/presentation/widgets/account_pic_modal_widget.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: AppGlobal.bgGradient,
          ),
          child: Column(
            children: [
              _buildAccountAppBar(),
              Padding(
                padding:
                    EdgeInsets.only(left: 20.sp, right: 20.sp, bottom: 20.sp),
                child: _buildAccountInfo(),
              ),
              _buildMatchesAccount(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAccountAppBar() {
    return Padding(
      padding: EdgeInsets.only(top: 10.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(
              Bootstrap.arrow_left,
              size: 24.sp,
            ),
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              padding: EdgeInsets.all(10.sp),
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent, // <-- Button color
              foregroundColor: AppColors.primaryBg, // <-- Splash color
            ),
          ),
          ElevatedButton(
            onPressed: () {
              AppModalStyle.bottomModalSheetStyle(
                context,
                (BuildContext context) {
                  return AccountModalWidget();
                },
              );
            },
            child: Icon(
              Bootstrap.gear,
              size: 22.sp,
            ),
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              padding: EdgeInsets.all(10.sp),
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent, // <-- Button color
              foregroundColor: AppColors.primaryBg, // <-- Splash color
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAccountInfo() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              child: Column(
                children: [
                  Text(
                    '24K',
                    style: AppTextStyle.primaryTextWhite22Bold,
                  ),
                  Text(
                    'Likes',
                    style: AppTextStyle.primaryTextWhite16Meduim,
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () {
                AppModalStyle.dialogModalStyle(
                    context, AccountPicModalWidget());
              },
              child: Container(
                width: 84.sp,
                height: 84.sp,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.sp),
                  border: Border.all(
                    color: Colors.white,
                    width: 2.sp,
                  ),
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60'),
                  ),
                ),
              ),
            ),
            InkWell(
              child: Column(
                children: [
                  Text(
                    '12K',
                    style: AppTextStyle.primaryTextWhite22Bold,
                  ),
                  Text(
                    'Stars',
                    style: AppTextStyle.primaryTextWhite16Meduim,
                  )
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20.sp,
        ),
        Text(
          'John Doe',
          style: AppTextStyle.primaryTextWhite22Bold,
        ),
        SizedBox(
          height: 5.sp,
        ),
        Text(
          'john.doe@gmail.com',
          style: AppTextStyle.primaryTextWhite16Meduim,
        ),
        SizedBox(
          height: 5.sp,
        ),
        Text(
          'I exist to design pixels, beyond that my life is void and meaningless... i\'m just kidding I live to make other peoples lives easier',
          style: AppTextStyle.primaryTextWhite14Meduim,
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  Widget _buildMatchesAccount() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(top: 20.sp, left: 20.sp, right: 20.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.sp),
            topRight: Radius.circular(12.sp),
          ),
          color: AppColors.primaryBg,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Matches',
              style: AppTextStyle.primaryTextblack22Bold,
            ),
            SizedBox(
              height: 10.sp,
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  return _buildMatchItem();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMatchItem() {
    return InkWell(
      child: Column(
        children: [
          Container(
            width: 54.sp,
            height: 54.sp,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.sp),
              image: DecorationImage(
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 5.sp,
          ),
          Text(
            'John Doe',
            style: AppTextStyle.primaryTextBlack14Regular,
          ),
        ],
      ),
    );
  }
}
