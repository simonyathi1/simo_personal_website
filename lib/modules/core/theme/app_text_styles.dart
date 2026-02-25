import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_fonts.dart';

abstract final class AppTextStyles {
  static const TextStyle heroTitle = TextStyle(
    fontSize: 80,
    height: 1,
    fontFamily: AppFonts.crimsonText,
  );

  static const TextStyle sectionTitle = TextStyle(
    fontSize: 60,
    fontWeight: FontWeight.w500,
    fontFamily: AppFonts.crimsonText,
  );

  static const TextStyle sectionTitleBold = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.bold,
    fontFamily: AppFonts.crimsonText,
  );

  static const TextStyle cardTitle = TextStyle(
    fontSize: 23,
    fontWeight: FontWeight.w600,
    fontFamily: AppFonts.crimsonText,
  );

  static const TextStyle label = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: AppColors.lightGrey,
    fontFamily: AppFonts.montserrat,
  );

  static const TextStyle labelUppercase = TextStyle(
    fontSize: 13,
    color: Colors.grey,
    fontFamily: AppFonts.montserrat,
  );

  static const TextStyle body = TextStyle(
    fontSize: 20,
    color: AppColors.lightPrimary,
    fontFamily: AppFonts.crimsonText,
  );

  static const TextStyle statValue = TextStyle(
    fontSize: 65,
    color: AppColors.lightPrimary,
    fontFamily: AppFonts.crimsonText,
  );

  static const TextStyle skillPercent = TextStyle(
    fontSize: 45,
    fontFamily: AppFonts.crimsonText,
  );

  static const TextStyle skillName = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    fontFamily: AppFonts.montserrat,
  );

  static const TextStyle navItem = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    fontFamily: AppFonts.montserrat,
  );

  static const TextStyle navBrand = TextStyle(
    fontSize: 14,
    color: AppColors.lightPrimary,
    letterSpacing: 4,
    fontWeight: FontWeight.bold,
    fontFamily: AppFonts.montserrat,
  );

  static const TextStyle footerCaption = TextStyle(
    color: AppColors.lightPrimary,
    fontFamily: AppFonts.montserrat,
  );

  // ── Project card ─────────────────────────────────────────────────────────────

  static const TextStyle projectCardLabel = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    fontFamily: AppFonts.montserrat,
    color: AppColors.textDimmed,
  );

  static const TextStyle projectCardTitle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    fontFamily: AppFonts.montserrat,
  );

  static const TextStyle projectCardSummary = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    fontFamily: AppFonts.montserrat,
    color: AppColors.textMuted,
  );

  // ── Work detail popup ────────────────────────────────────────────────────────

  static const TextStyle popupBody = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontFamily: AppFonts.montserrat,
  );

  static TextTheme get textTheme => const TextTheme(
        displayLarge: heroTitle,
        titleLarge: sectionTitle,
        titleMedium: sectionTitleBold,
        bodyLarge: body,
        labelSmall: label,
      );
}
