import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_fonts.dart';
import 'app_text_styles.dart';

abstract final class AppTheme {
  static ThemeData get light => ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.lightPrimary,
          brightness: Brightness.light,
          surface: AppColors.lightBackground,
          primary: AppColors.lightPrimary,
          secondary: AppColors.lightSecondary,
          error: AppColors.lightAccent,
        ),
        scaffoldBackgroundColor: AppColors.lightBackground,
        fontFamily: AppFonts.crimsonText,
        textTheme: AppTextStyles.textTheme,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.lightBackground,
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
        cardTheme: const CardThemeData(
          color: Colors.white,
          surfaceTintColor: Colors.white,
          elevation: 8,
        ),
        dividerTheme: const DividerThemeData(
          color: AppColors.divider,
          thickness: 0.5,
          space: 1,
        ),
        useMaterial3: true,
      );
}
