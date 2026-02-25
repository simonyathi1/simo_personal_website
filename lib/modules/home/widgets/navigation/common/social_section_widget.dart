import 'package:flutter/material.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/content/portfolio_content.dart';
import 'social_item_widget.dart';

class SocialSectionWidget extends StatelessWidget {
  final Color originalColor;

  const SocialSectionWidget({super.key, required this.originalColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        for (final link in PortfolioContent.socialLinks) ...[
          SocialItemWidget(link: link, originalColor: originalColor),
          const SizedBox(width: AppSpacing.socialIconGap),
        ],
      ],
    );
  }
}
