import 'package:flutter/material.dart';
import 'package:mobile/core/styles/app_colors.dart';
import 'package:mobile/core/styles/app_input_decoration.dart';

class AppInputWidget extends StatelessWidget {
  TextEditingController? controller;
  String? label;
  String? hint;
  Widget? prefixIcon;
  Widget? suffixIcon;
  bool? obscureText;
  TextInputType? keyboardType;
  AppInputWidget({
    Key? key,
    this.controller,
    this.label,
    this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: AppColors.primary,
      decoration: AppInputDecoration.inputDecoration(
        label,
        hint,
        prefixIcon,
        suffixIcon,
      ),
      keyboardType: keyboardType,
      obscureText: obscureText ?? false,
    );
  }
}
