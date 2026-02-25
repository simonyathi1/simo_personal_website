import 'package:flutter/material.dart';
import '../../../../core/content/portfolio_content.dart';
import '../../../../core/constants/app_spacing.dart';
import 'right_panel_item_widget.dart';

class AboutMeRightPanelWidget extends StatelessWidget {
  const AboutMeRightPanelWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
}
