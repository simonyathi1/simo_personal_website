import 'package:flutter/material.dart';

/// Breakpoints:
///   mobile  < 850
///   tablet  850 – 1099
///   desktop ≥ 1100
abstract final class Responsive {
  static const double _mobileMax  = 850.0;
  static const double _tabletMax  = 1100.0;

  static bool isMobile(BuildContext context) =>
      MediaQuery.sizeOf(context).width < _mobileMax;

  static bool isTablet(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    return w >= _mobileMax && w < _tabletMax;
  }

  static bool isDesktop(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= _tabletMax;

  /// Returns one of three typed values depending on the current breakpoint.
  static T value<T>(
    BuildContext context, {
    required T mobile,
    required T tablet,
    required T desktop,
  }) {
    if (isMobile(context)) return mobile;
    if (isTablet(context)) return tablet;
    return desktop;
  }
}

/// Builds a different widget tree per breakpoint.
///
/// If [tablet] is omitted, the tablet breakpoint falls back to [desktop].
class ResponsiveLayout extends StatelessWidget {
  final Widget Function(BuildContext) mobile;
  final Widget Function(BuildContext)? tablet;
  final Widget Function(BuildContext) desktop;

  const ResponsiveLayout({
    super.key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    if (Responsive.isMobile(context)) return mobile(context);
    if (Responsive.isTablet(context)) return (tablet ?? desktop)(context);
    return desktop(context);
  }
}
