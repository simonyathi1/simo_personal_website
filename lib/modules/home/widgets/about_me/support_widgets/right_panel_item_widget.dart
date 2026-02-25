import 'package:flutter/material.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';

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
        Text(title.toUpperCase(), style: AppTextStyles.labelUppercase, textAlign: TextAlign.end),
        const SizedBox(height: AppSpacing.aboutItemTitleGap),
        Text(detail, style: AppTextStyles.statValue, textAlign: TextAlign.end),
        const SizedBox(height: AppSpacing.aboutItemDetailGap),
      ],
    );
  }
}
