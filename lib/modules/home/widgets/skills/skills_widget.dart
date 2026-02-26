import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/content/portfolio_content.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/util/responsive.dart';
import 'support_widgets/skill_item_widget.dart';

class SkillsWidget extends StatelessWidget {
  const SkillsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: AppSpacing.dividerTopPadding),
          child: Divider(),
        ),
        SizedBox(height: AppSpacing.sectionTitleTopBottom(context)),
        Text('My Skills and Abilities', style: AppTextStyles.sectionTitleBoldR(context)),
        SizedBox(height: AppSpacing.sectionTitleTopBottom(context)),
        // On mobile let the cards drive the height (no fixed clip).
        // On desktop/tablet the pattern background is behind a fixed-height row.
        isMobile ? _buildMobileSkillRow() : _buildDesktopSkillRow(context),
      ],
    );
  }

  Widget _buildMobileSkillRow() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (final skill in PortfolioContent.skills)
              SkillItemWidget(skill: skill),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopSkillRow(BuildContext context) {
    final rowHeight = AppSpacing.skillCardRowHeightR(context);
    return Stack(
      children: [
        Center(
          child: SizedBox(
            height: rowHeight,
            child: Image.asset(
              'assets/images/logo/pattern5.png',
              color: CupertinoColors.inactiveGray,
            ),
          ),
        ),
        Center(
          child: SizedBox(
            height: rowHeight,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (final skill in PortfolioContent.skills)
                    SkillItemWidget(skill: skill),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
