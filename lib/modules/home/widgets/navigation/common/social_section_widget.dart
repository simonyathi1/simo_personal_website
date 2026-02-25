import 'package:flutter/material.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/content/portfolio_content.dart';
import 'social_item_widget.dart';

class SocialSectionWidget extends StatelessWidget {
  final Color originalColor;

  /// When [compact] is true only the first two social links are shown and
  /// the gap between them is halved — used on the mobile nav bar.
  final bool compact;

  const SocialSectionWidget({
    super.key,
    required this.originalColor,
    this.compact = false,
  });

  @override
  Widget build(BuildContext context) {
    final links = compact
        ? PortfolioContent.socialLinks.take(2).toList()
        : PortfolioContent.socialLinks;
    final gap = compact ? AppSpacing.socialIconGap / 2 : AppSpacing.socialIconGap;

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: compact ? MainAxisSize.min : MainAxisSize.max,
      children: [
        for (final link in links) ...[
          SocialItemWidget(link: link, originalColor: originalColor),
          SizedBox(width: gap),
        ],
      ],
    );
  }
}
