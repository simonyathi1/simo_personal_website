import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/content/portfolio_content.dart';
import '../../../../core/theme/app_text_styles.dart';
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
        Container(
          padding: const EdgeInsets.all(AppSpacing.footerPadding),
          height: AppSpacing.footerHeight,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(PortfolioContent.footerCopyright, style: AppTextStyles.footerCaption),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(PortfolioContent.primaryEmail, style: AppTextStyles.footerCaption),
                  Text(PortfolioContent.businessEmail, style: AppTextStyles.footerCaption),
                  // Text("simonyathi1@gmail.com", style: TextStyle(color: lightSecondaryColor, fontFamily: 'Montserrat'),),
                  // Text("onesimonyathi@fidelitech.co.za", style: TextStyle(color: lightSecondaryColor, fontFamily: 'Montserrat'),),
                ],
              ),
              SocialSectionWidget(originalColor: AppColors.lightPrimary),
            ],
          ),
        ),
      ],
    );
  }
}
