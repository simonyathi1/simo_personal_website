import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/content/portfolio_content.dart';
import '../../../core/theme/app_text_styles.dart';
import 'support_widgets/experience_card_widget.dart';

class EducationAndExperienceWidget extends StatelessWidget {
  const EducationAndExperienceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: AppSpacing.dividerTopPadding),
          child: Divider(),
        ),
        const SizedBox(height: AppSpacing.sectionTitleTop),
        const Text('Education & Experience',
            style: AppTextStyles.sectionTitleBold),
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
            const SizedBox(
              height: AppSpacing.experienceRowHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(child: ExperienceCardWidget(title: 'Education: 2011 – 2016', experiences: PortfolioContent.education, cardElevation: 4)),
                  Expanded(child: ExperienceCardWidget(title: '2017 – 2018', experiences: PortfolioContent.experience2017, cardElevation: 8)),
                  Expanded(child: ExperienceCardWidget(title: '2019 – 2021', experiences: PortfolioContent.experience2019, cardElevation: 16)),
                  Expanded(child: ExperienceCardWidget(title: '2021 – Present', experiences: PortfolioContent.experience2021, cardElevation: 32)),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
