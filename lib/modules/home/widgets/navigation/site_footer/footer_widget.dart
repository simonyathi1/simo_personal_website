import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/content/portfolio_content.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/util/responsive.dart';
import '../common/social_section_widget.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: AppSpacing.dividerTopPadding),
          child: Divider(),
        ),
        ResponsiveLayout(
          mobile: (_) => _buildMobileFooter(),
          desktop: (_) => _buildDesktopFooter(),
        ),
      ],
    );
  }

  Widget _buildDesktopFooter() {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.footerPadding),
      height: AppSpacing.footerHeight,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(PortfolioContent.footerCopyright, style: AppTextStyles.footerCaption),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(PortfolioContent.primaryEmail,  style: AppTextStyles.footerCaption),
              Text(PortfolioContent.businessEmail, style: AppTextStyles.footerCaption),
            ],
          ),
          SocialSectionWidget(originalColor: AppColors.lightPrimary),
        ],
      ),
    );
  }

  Widget _buildMobileFooter() {
    return const Padding(
      padding: EdgeInsets.all(AppSpacing.footerPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SocialSectionWidget(originalColor: AppColors.lightPrimary),
          SizedBox(height: AppSpacing.md),
          Text(PortfolioContent.primaryEmail,  style: AppTextStyles.footerCaption),
          Text(PortfolioContent.businessEmail, style: AppTextStyles.footerCaption),
          SizedBox(height: AppSpacing.md),
          Text(PortfolioContent.footerCopyright, style: AppTextStyles.footerCaption),
          SizedBox(height: AppSpacing.md),
        ],
      ),
    );
  }
}
