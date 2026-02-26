import 'package:flutter/material.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';

/// Full-size vertical stat item — used on desktop/tablet.
class AboutMeRightPanelWidgetItem extends StatelessWidget {
  final String title;
  final String detail;

  const AboutMeRightPanelWidgetItem({
    super.key,
    required this.title,
    required this.detail,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          title.toUpperCase(),
          style: AppTextStyles.labelUppercase,
          textAlign: TextAlign.end,
        ),
        const SizedBox(height: AppSpacing.aboutItemTitleGap),
        Text(
          detail,
          style: AppTextStyles.statValue,
          textAlign: TextAlign.end,
        ),
        const SizedBox(height: AppSpacing.aboutItemDetailGap),
      ],
    );
  }
}

/// Compact vertical stat chip — used inside the mobile horizontal row.
class AboutMeStatChip extends StatelessWidget {
  final String label;
  final String value;

  const AboutMeStatChip({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
          style: AppTextStyles.statValueR(context),
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          label.toUpperCase(),
          style: AppTextStyles.labelUppercase,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
