import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/content/portfolio_content.dart';
import '../../../core/theme/app_text_styles.dart';
import 'support_widgets/project_card_widget.dart';

class PDPAndProjectsWidget extends StatelessWidget {
  const PDPAndProjectsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: AppSpacing.dividerTopPadding),
          child: Divider(),
        ),
        const SizedBox(height: AppSpacing.sectionTitleTop),
        const Center(
          child: Text('Projects & Personal Development', style: AppTextStyles.sectionTitleBold),
        ),
        const SizedBox(height: AppSpacing.sectionTitleBottom),
        Stack(
          children: [
            LayoutBuilder(
              builder: (_, constraints) => Center(
                child: Image.asset(
                  'assets/images/logo/pattern5.png',
                  color: CupertinoColors.inactiveGray,
                  width: constraints.maxWidth,
                ),
              ),
            ),
            SizedBox(
              height: AppSpacing.projectSectionHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(child: ProjectCardWidget(project: PortfolioContent.projects[0], cardElevation: 8)),
                  Expanded(child: ProjectCardWidget(project: PortfolioContent.projects[1], cardElevation: 22)),
                  Expanded(child: ProjectCardWidget(project: PortfolioContent.projects[2], cardElevation: 8)),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
