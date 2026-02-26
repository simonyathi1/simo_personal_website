import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/content/portfolio_content.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/util/responsive.dart';
import 'support_widgets/experience_card_widget.dart';

class EducationAndExperienceWidget extends StatelessWidget {
  const EducationAndExperienceWidget({super.key});

  static const _cards = [
    (title: 'Education: 2011 – 2016', experiences: PortfolioContent.education,      elevation: 4.0),
    (title: '2017 – 2018',            experiences: PortfolioContent.experience2017,  elevation: 8.0),
    (title: '2019 – 2021',            experiences: PortfolioContent.experience2019,  elevation: 16.0),
    (title: '2021 – 2024',            experiences: PortfolioContent.experience2021,  elevation: 32.0),
    (title: '2024 – Present',         experiences: PortfolioContent.experience2024,  elevation: 48.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: AppSpacing.dividerTopPadding),
          child: Divider(),
        ),
        SizedBox(height: AppSpacing.sectionTitleTopBottom(context)),
        Center(
          child: Text(
            'Education & Experience',
            style: AppTextStyles.sectionTitleBoldR(context),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: AppSpacing.sectionTitleTopBottom(context)),
        ResponsiveLayout(
          mobile: (_) => _buildWrap(context, fractionOfScreen: 1.0),
          tablet: (_) => _buildWrap(context, fractionOfScreen: 0.5),
          desktop: (_) => _buildDesktopRow(context),
        ),
      ],
    );
  }

  Widget _buildDesktopRow(BuildContext context) {
    final height = AppSpacing.experienceRowHeightR(context);
    return Stack(
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
          height: height,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (final c in _cards)
                Expanded(
                  child: ExperienceCardWidget(
                    title: c.title,
                    experiences: c.experiences,
                    cardElevation: c.elevation,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildWrap(BuildContext context, {required double fractionOfScreen}) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final cardWidth   = screenWidth * fractionOfScreen - AppSpacing.md * 2;

    return Wrap(
      spacing: AppSpacing.md,
      runSpacing: AppSpacing.md,
      children: [
        for (final c in _cards)
          SizedBox(
            width: cardWidth,
            child: ExperienceCardWidget(
              title: c.title,
              experiences: c.experiences,
              cardElevation: c.elevation,
            ),
          ),
      ],
    );
  }
}
