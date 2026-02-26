import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/content/portfolio_content.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/util/responsive.dart';
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
        SizedBox(height: AppSpacing.sectionTitleTopBottom(context)),
        Center(
          child: Text(
            'Projects Over the Years',
            style: AppTextStyles.sectionTitleBoldR(context),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: AppSpacing.sectionTitleTopBottom(context)),
        ResponsiveLayout(
          mobile: (_) => _buildColumn(context),
          tablet: (_) => _buildHorizontalScroll(context),
          desktop: (_) => _buildDesktopRow(context),
        ),
      ],
    );
  }

  // ── Desktop: 3-col expanded row (unchanged) ─────────────────────────────────

  Widget _buildDesktopRow(BuildContext context) {
    return Stack(
      // alignment: Alignment.center,
      children: [
        LayoutBuilder(
          builder: (_, constraints) => Center(
            child: Image.asset(
              'assets/images/logo/pattern5.png',
              color: CupertinoColors.inactiveGray,
              width: constraints.maxWidth,
              height: 500,
            ),
          ),
        ),
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (int i = 0; i < PortfolioContent.projects.length; i++)
                Expanded(
                  child: ProjectCardWidget(
                    project: PortfolioContent.projects[i],
                    cardElevation: _elevation(i),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  // ── Tablet: fixed-width cards in a horizontal scroll ───────────────────────

  Widget _buildHorizontalScroll(BuildContext context) {
    final cardWidth = MediaQuery.sizeOf(context).width * 0.45;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (int i = 0; i < PortfolioContent.projects.length; i++)
            SizedBox(
              width: cardWidth,
              child: ProjectCardWidget(
                project: PortfolioContent.projects[i],
                cardElevation: _elevation(i),
              ),
            ),
        ],
      ),
    );
  }

  // ── Mobile: single column ──────────────────────────────────────────────────

  Widget _buildColumn(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < PortfolioContent.projects.length; i++)
          ProjectCardWidget(
            project: PortfolioContent.projects[i],
            cardElevation: _elevation(i),
          ),
      ],
    );
  }

  static double _elevation(int index) {
    const elevations = [8.0, 22.0, 8.0];
    return elevations[index % elevations.length];
  }
}
