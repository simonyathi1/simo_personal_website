import 'package:flutter/material.dart';
import '../util/responsive.dart';

abstract final class AppSpacing {
  // ── Page ─────────────────────────────────────────────────────────────────────
  static const double pageHorizontalPadding = 150.0;
  static const double pageVerticalPadding   = 20.0;

  static double pageHPadding(BuildContext context) =>
      Responsive.value(context, mobile: 16.0, tablet: 60.0, desktop: 150.0);

  // ── Nav bar ──────────────────────────────────────────────────────────────────
  static const double navBarHeight       = 180.0;
  static const double navBarLogoHeight   = 60.0;
  static const double navItemSize        = 100.0;
  static const double navLogoLeftPadding = 120.0;

  static double navBarH(BuildContext context) =>
      Responsive.value(context, mobile: 60.0, tablet: 100.0, desktop: 180.0);

  static double navLogoLeftPad(BuildContext context) =>
      Responsive.value(context, mobile: 12.0, tablet: 40.0, desktop: 120.0);

  static double navItemSizeR(BuildContext context) =>
      Responsive.value(context, mobile: 60.0, tablet: 70.0, desktop: 100.0);

  // ── Section spacing ───────────────────────────────────────────────────────────
  static const double sectionSpacing      = 18.0;
  static const double heroBottomSpacing   = 80.0;
  static const double dividerTopPadding   = 20.0;
  static const double dividerBottomPadding = 20.0;
  static const double dividerThickness    = 0.5;
  static const double sectionTitleTop     = 80.0;
  static const double sectionTitleBottom  = 80.0;

  static double sectionTitleTopBottom(BuildContext context) =>
      Responsive.value(context, mobile: 32.0, tablet: 56.0, desktop: 80.0);

  // ── Cards ─────────────────────────────────────────────────────────────────────
  static const double cardPadding  = 16.0;
  static const double cardHeight   = 400.0;
  static const double cardRadius   = 8.0;

  // ── Skills ────────────────────────────────────────────────────────────────────
  static const double skillCardWidth       = 225.0;
  static const double skillCardMarginH     = 30.0;
  static const double skillCardRowHeight   = 400.0;
  static const double skillImageSize       = 170.0;
  static const double skillImagePadding    = 25.0;
  static const double skillCircleRadius    = 360.0;
  static const double skillCirclePaddingH  = 18.0;
  static const double skillCirclePaddingV  = 32.0;
  static const double skillNameGap         = 22.0;

  static double skillCardWidthR(BuildContext context) =>
      Responsive.value(context, mobile: 150.0, tablet: 190.0, desktop: 225.0);

  static double skillCardRowHeightR(BuildContext context) =>
      Responsive.value(context, mobile: 280.0, tablet: 340.0, desktop: 400.0);

  // ── About Me panels ──────────────────────────────────────────────────────────
  static const double aboutPanelPadding       = 12.0;
  static const double aboutItemTitleGap       = 38.0;
  static const double aboutItemDetailGap      = 64.0;
  static const double mainImageWidth          = 600.0;
  static const double mainImageHeight         = 850.0;
  static const double mainImageWidthBorder    = 669.0;
  static const double mainImageHeightBorder   = 890.0;

  // ── Companies banner ──────────────────────────────────────────────────────────
  static const double companiesBannerHeight   = 120.0;
  static const double companyItemWidth        = 120.0;
  static const double companyImageWidth       = 150.0;
  static const double companyImageHeight      = 54.0;

  // ── Experience section ────────────────────────────────────────────────────────
  static const double experienceRowHeight     = 600.0;

  static double experienceRowHeightR(BuildContext context) =>
      Responsive.value(context, mobile: 470.0, tablet: 480.0, desktop: 600.0);

  static double experienceRCardHeightR(BuildContext context) =>
      Responsive.value(context, mobile: 400.0, tablet: 410.0, desktop: 500.0);

  // ── Project cards ─────────────────────────────────────────────────────────────
  static const double projectCardHeight          = 430.0;
  static const double projectCardImageHeight     = 300.0;
  static const double projectCardRadius          = 45.0;
  static const double projectCardContentPaddingH = 50.0;
  static const double projectSectionHeight       = 550.0;

  static double projectCardHeightR(BuildContext context) =>
      Responsive.value(context, mobile: 380.0, tablet: 400.0, desktop: 430.0);

  static double projectCardImageHeightR(BuildContext context) =>
      Responsive.value(context, mobile: 220.0, tablet: 260.0, desktop: 300.0);

  // ── Work detail popup ─────────────────────────────────────────────────────────
  static const double popupWidthFraction      = 0.5;
  static const double popupMaxHeightFraction  = 0.8;

  static double popupWidthFractionR(BuildContext context) =>
      Responsive.value(context, mobile: 0.92, tablet: 0.7, desktop: 0.5);

  // ── Contact section ───────────────────────────────────────────────────────────
  static const double contactCardSectionHeight = 600.0;
  static const double contactCardMargin        = 80.0;

  /// Returns null on mobile (unconstrained height).
  static double? contactCardSectionH(BuildContext context) =>
      Responsive.value<double?>(
        context,
        mobile: null,
        tablet: 500.0,
        desktop: 600.0,
      );

  static double contactCardMarginVal(BuildContext context) =>
      Responsive.value(context, mobile: 16.0, tablet: 40.0, desktop: 80.0);

  // ── Social icons ──────────────────────────────────────────────────────────────
  static const double socialIconSize  = 20.0;
  static const double socialIconGap   = 30.0;

  // ── Footer ────────────────────────────────────────────────────────────────────
  static const double footerHeight  = 100.0;
  static const double footerPadding = 18.0;

  // ── General tokens ────────────────────────────────────────────────────────────
  static const double xs  = 4.0;
  static const double sm  = 8.0;
  static const double md  = 16.0;
  static const double lg  = 24.0;
  static const double xl  = 32.0;
  static const double xxl = 48.0;
}
