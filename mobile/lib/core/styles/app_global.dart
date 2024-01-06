import 'package:flutter/material.dart';
import 'package:mobile/core/styles/app_colors.dart';

class AppGlobal {
  static Gradient bgGradient = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [
      0.2,
      0.8,
    ],
    colors: [
      AppColors.primary,
      AppColors.secondary,
    ],
  );
}
