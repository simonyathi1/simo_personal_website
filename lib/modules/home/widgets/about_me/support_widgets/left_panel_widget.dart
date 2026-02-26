import 'package:flutter/material.dart';
import '../../../../core/content/portfolio_content.dart';
import '../../../../core/constants/app_spacing.dart';
import 'left_panel_item_widget.dart';

class AboutMeLeftPanelWidget extends StatelessWidget {
  const AboutMeLeftPanelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(AppSpacing.aboutPanelPadding),
      child: Column(
        children: [
          AboutMeLeftPanelWidgetItem(
            title: 'Biography',
            detail: PortfolioContent.biography,
          ),
        ],
      ),
    );
  }
}
