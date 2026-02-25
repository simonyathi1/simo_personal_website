import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/content/portfolio_content.dart';
import '../../../core/theme/app_text_styles.dart';
import 'support_widgets/skill_item_widget.dart';

class SkillsWidget extends StatelessWidget {
  const SkillsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: AppSpacing.dividerTopPadding),
          child: Divider(),
        ),
        const SizedBox(height: AppSpacing.sectionTitleTop),
        const Text('My Skills and Abilities', style: AppTextStyles.sectionTitleBold),
        const SizedBox(height: AppSpacing.sectionTitleBottom),
        Stack(
          children: [
            Center(
              child: SizedBox(
                height: AppSpacing.skillCardRowHeight,
                child: Image.asset(
                  'assets/images/logo/pattern5.png',
                  color: CupertinoColors.inactiveGray,
                ),
              ),
            ),
            Center(
              child: SizedBox(
                height: AppSpacing.skillCardRowHeight,
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
        ),
      ],
    );
  }
}
