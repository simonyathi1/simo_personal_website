import 'package:flutter/material.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/content/portfolio_content.dart';
import '../../../core/theme/app_text_styles.dart';

class LandingWidget extends StatelessWidget {
  const LandingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.md,
      ),
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: const Text(
          PortfolioContent.heroTitle,
          style: AppTextStyles.heroTitle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
