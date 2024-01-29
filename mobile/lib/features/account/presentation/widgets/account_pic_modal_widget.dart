import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/core/styles/app_colors.dart';
import 'package:mobile/core/styles/app_text_style.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile/features/account/presentation/blocs/remote/account/account_bloc.dart';

class AccountPicModalWidget extends StatefulWidget {
  const AccountPicModalWidget({super.key});

  @override
  State<AccountPicModalWidget> createState() => _AccountPicModalWidgetState();
}

class _AccountPicModalWidgetState extends State<AccountPicModalWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.sp,
      width: MediaQuery.of(context).size.width * .8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Change Profile Picture',
            style: AppTextStyle.primaryTextBlack16Meduim,
          ),
          Container(
            height: 130.sp,
            width: 130.sp,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(130.sp),
              border: Border.all(
                color: AppColors.primaryBr,
                width: 2,
              ),
              image: DecorationImage(
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Camera',
                  style: AppTextStyle.primaryTextWhite16Meduim,
                ),
                style: ElevatedButton.styleFrom(
                    foregroundColor: AppColors.primaryBg,
                    backgroundColor: AppColors.primary,
                    disabledBackgroundColor: AppColors.primary,
                    disabledForegroundColor: AppColors.primaryBg,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.sp),
                    ),
                    padding: EdgeInsets.all(10.sp)),
              ),
              ElevatedButton(
                onPressed: () async {
                  XFile? file;
                  file = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
                  if (file != null) {
                    MultipartFile path =
                        await MultipartFile.fromFile(file.path);
                    BlocProvider.of<AccountBloc>(context).add(
                      UploadProfileMedia(file: path),
                    );
                  }
                },
                child: Text(
                  'Gallery',
                  style: AppTextStyle.primaryTextWhite16Meduim,
                ),
                style: ElevatedButton.styleFrom(
                    foregroundColor: AppColors.primaryBg,
                    backgroundColor: AppColors.primary,
                    disabledBackgroundColor: AppColors.primary,
                    disabledForegroundColor: AppColors.primaryBg,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.sp),
                    ),
                    padding: EdgeInsets.all(10.sp)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
