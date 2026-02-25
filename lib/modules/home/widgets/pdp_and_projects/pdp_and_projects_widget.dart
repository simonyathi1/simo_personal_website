import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:simo_personal_website/modules/core/widget_data_builder/project_card_data.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/theme/app_text_styles.dart';

import 'support_widgets/project_card_widget.dart';
class _Project {
  final String title;
  final String description;
  final String tech;
  const _Project({required this.title, required this.description, required this.tech});
}

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
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Center(
                child: Image.asset(
                  'assets/images/logo/pattern5.png',
                  color: CupertinoColors.inactiveGray,
                ),
              ),
            ),
            SizedBox(
              height: 550,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(child: ProjectCardWidget(projectItemModel: ProjectCardData().work, cardElevation: 8)),
                  Expanded(child: ProjectCardWidget(projectItemModel: ProjectCardData().pdp, cardElevation: 22)),
                  Expanded(child: ProjectCardWidget(projectItemModel: ProjectCardData().personal, cardElevation: 8)),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
