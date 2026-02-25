import 'package:flutter/material.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/util/responsive.dart';

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
    final titleGap  = Responsive.value<double>(
      context,
      mobile: 8.0,
      tablet: 20.0,
      desktop: AppSpacing.aboutItemTitleGap,
    );
    final detailGap = Responsive.value<double>(
      context,
      mobile: 20.0,
      tablet: 36.0,
      desktop: AppSpacing.aboutItemDetailGap,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title.toUpperCase(), style: AppTextStyles.labelUppercase),
        SizedBox(height: titleGap),
        Text(detail, style: AppTextStyles.bodyR(context)),
        SizedBox(height: detailGap),
      ],
    );
  }
}
