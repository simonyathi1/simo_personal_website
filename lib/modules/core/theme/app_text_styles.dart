import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_fonts.dart';
import '../util/responsive.dart';

abstract final class AppTextStyles {
  // ── Desktop / const styles ───────────────────────────────────────────────────
  // These are the canonical desktop sizes used as const fallbacks and in tests.

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

  // ── Responsive variants ──────────────────────────────────────────────────────
  // Widgets that contain large display text call these instead of the const
  // versions so the copy scales gracefully on smaller viewports.

  static TextStyle heroTitleR(BuildContext context) => heroTitle.copyWith(
        fontSize: Responsive.value(
          context,
          mobile: 32.0,
          tablet: 52.0,
          desktop: 80.0,
        ),
      );

  static TextStyle sectionTitleR(BuildContext context) => sectionTitle.copyWith(
        fontSize: Responsive.value(
          context,
          mobile: 28.0,
          tablet: 42.0,
          desktop: 60.0,
        ),
      );

  static TextStyle sectionTitleBoldR(BuildContext context) =>
      sectionTitleBold.copyWith(
        fontSize: Responsive.value(
          context,
          mobile: 22.0,
          tablet: 30.0,
          desktop: 40.0,
        ),
      );

  static TextStyle statValueR(BuildContext context) => statValue.copyWith(
        fontSize: Responsive.value(
          context,
          mobile: 32.0,
          tablet: 45.0,
          desktop: 65.0,
        ),
      );

  static TextStyle skillPercentR(BuildContext context) =>
      skillPercent.copyWith(
        fontSize: Responsive.value(
          context,
          mobile: 24.0,
          tablet: 32.0,
          desktop: 45.0,
        ),
      );

  static TextStyle bodyR(BuildContext context) => body.copyWith(
        fontSize: Responsive.value(
          context,
          mobile: 14.0,
          tablet: 16.0,
          desktop: 20.0,
        ),
      );

  // ── TextTheme ────────────────────────────────────────────────────────────────

  static TextTheme get textTheme => const TextTheme(
        displayLarge: heroTitle,
        titleLarge: sectionTitle,
        titleMedium: sectionTitleBold,
        bodyLarge: body,
        labelSmall: label,
      );
}
