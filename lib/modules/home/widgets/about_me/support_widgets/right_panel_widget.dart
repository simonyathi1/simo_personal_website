import 'package:flutter/material.dart';
import '../../../../core/content/portfolio_content.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/util/responsive.dart';
import 'right_panel_item_widget.dart';

class AboutMeRightPanelWidget extends StatelessWidget {
  const AboutMeRightPanelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    if (Responsive.isMobile(context)) {
      return _buildMobileStatStrip();
    }
    return const Padding(
      padding: EdgeInsets.all(AppSpacing.aboutPanelPadding),
      child: Column(
        children: [
          AboutMeRightPanelWidgetItem(
            title: 'Years of\nExperience',
            detail: PortfolioContent.yearsOfExperience,
          ),
          AboutMeRightPanelWidgetItem(
            title: 'Companies\nWorked For',
            detail: PortfolioContent.companiesWorkedFor,
          ),
          AboutMeRightPanelWidgetItem(
            title: 'Corporate Projects',
            detail: PortfolioContent.corporateProjects,
          ),
        ],
      ),
    );
  }

  Widget _buildMobileStatStrip() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppSpacing.lg,
        horizontal: AppSpacing.md,
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: AboutMeStatChip(
              label: 'Years\nExperience',
              value: PortfolioContent.yearsOfExperience,
            ),
          ),
          _Divider(),
          Expanded(
            child: AboutMeStatChip(
              label: 'Companies\nWorked For',
              value: PortfolioContent.companiesWorkedFor,
            ),
          ),
          _Divider(),
          Expanded(
            child: AboutMeStatChip(
              label: 'Corporate\nProjects',
              value: PortfolioContent.corporateProjects,
            ),
          ),
        ],
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: VerticalDivider(
        width: AppSpacing.lg,
        thickness: 0.5,
        color: Colors.grey.withOpacity(0.4),
      ),
    );
  }
}
