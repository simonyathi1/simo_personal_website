import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/models/project_item.dart';
import '../../../../core/theme/app_text_styles.dart';
import 'work_detail_popup.dart';

class ProjectCardWidget extends StatelessWidget {
  final ProjectItem project;
  final double cardElevation;

  const ProjectCardWidget({
    super.key,
    required this.project,
    required this.cardElevation,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        WorkDetailPopup.showWorkDetailPopup(
          context,
          '${project.title}: ${project.projectName}',
          project.projectDetail,
        );
      },
      hoverColor: AppColors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.cardPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: AppSpacing.sm, bottom: AppSpacing.xs),
              child: Text(
                project.title,
                style: AppTextStyles.label,
                textAlign: TextAlign.start,
              ),
            ),
            Card(
              elevation: cardElevation,
              color: AppColors.lightBackground,
              surfaceTintColor: AppColors.lightBackground,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(AppSpacing.projectCardRadius),
                ),
              ),
              child: SizedBox(
                height: AppSpacing.projectCardHeight,
                child: Column(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          height: AppSpacing.projectCardImageHeight,
                          child: Image.asset(
                            'assets/images/logo/pattern3.png',
                            color: AppColors.overlayBlueGrey,
                          ),
                        ),
                        Center(
                          child: Container(
                            padding: const EdgeInsets.all(AppSpacing.projectCardContentPaddingH),
                            height: AppSpacing.projectCardImageHeight,
                            child: Image.asset(project.imageAsset),
                          ),
                        ),
                        Center(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(AppSpacing.projectCardRadius),
                              topRight: Radius.circular(AppSpacing.projectCardRadius),
                            ),
                            child: Container(
                              color: AppColors.overlayLight,
                              height: AppSpacing.projectCardImageHeight,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.cardPadding,
                        vertical: AppSpacing.sm,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Current Project: ',
                            style: AppTextStyles.projectCardLabel,
                            textAlign: TextAlign.start,
                          ),
                          Flexible(
                            child: Text(
                              project.projectName,
                              style: AppTextStyles.projectCardTitle,
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.cardPadding,
                        vertical: AppSpacing.sm,
                      ),
                      child: Text(
                        project.projectSummary,
                        style: AppTextStyles.projectCardSummary,
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
