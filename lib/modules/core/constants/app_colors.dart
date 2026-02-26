import 'package:flutter/material.dart';

abstract final class AppColors {
  // Light theme
  static const Color lightBackground     = Color(0xFFFFFFFF);
  static const Color lightCardBackground = Color(0xFFF4F4F4);
  static const Color lightPrimary        = Color(0xFF002323);
  static const Color lightSecondary      = Color(0xFF001010);
  static const Color lightAccent         = Color(0xFFFF0062);
  static const Color lightSelection      = Color(0xFF011916);
  static const Color lightGrey           = Color(0xFF676767);

  // Dark theme
  static const Color darkBackground      = Color(0xFF011010);
  static const Color darkCardBackground  = Color(0xFF21222D);
  static const Color darkPrimary         = Color(0xFF009F9F);
  static const Color darkSecondary       = Color(0xFFFFFFFF);
  static const Color darkSelection       = Color(0xFF88B2AC);

  // Overlays (const alternatives to withOpacity)
  static const Color overlayLight        = Color(0x4D000000); // black @ ~30%
  static const Color overlayBlueGrey    = Color(0x4D607D8B); // blueGrey @ ~30%
  static const Color overlayHover       = Color(0x22000000); // very translucent for card hover
  static const Color textDimmed         = Color(0xA6000000); // black @ ~65%
  static const Color textMuted          = Color(0xBF000000); // black @ ~75%

  // Shared
  static const Color divider             = Colors.black;
  static const Color transparent         = Colors.transparent;
}
