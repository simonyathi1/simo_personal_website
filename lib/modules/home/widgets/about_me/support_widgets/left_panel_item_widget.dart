import 'package:flutter/material.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';

class AboutMeLeftPanelWidgetItem extends StatelessWidget {
  final String title;
  final String detail;

  const AboutMeLeftPanelWidgetItem({
    super.key,
    required this.title,
    required this.detail,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title.toUpperCase(), style: AppTextStyles.labelUppercase),
        const SizedBox(height: AppSpacing.aboutItemTitleGap),
        Text(detail, style: AppTextStyles.body),
        const SizedBox(height: AppSpacing.aboutItemDetailGap),
      ],
    );
  }
}
