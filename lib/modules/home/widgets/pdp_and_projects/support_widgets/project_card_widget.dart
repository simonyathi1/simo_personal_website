import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/models/project_item.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/util/responsive.dart';
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
    final headerHeight = Responsive.value<double>(
      context,
      mobile: 120.0,
      tablet: 140.0,
      desktop: 160.0,
    );
    final iconSize = headerHeight * 0.42;

    // Scale shadow depth from the elevation value so the middle card pops most.
    final shadowBlur    = cardElevation + 8;
    final shadowOpacity = (cardElevation / 60).clamp(0.07, 0.18);

    return Padding(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Card(
        // padding: const EdgeInsets.all(AppSpacing.xl),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppSpacing.projectCardRadius),
          ),
        ),
        child: InkWell(
          onTap: () => WorkDetailPopup.showWorkDetailPopup(
            context,
            '${project.title}: ${project.projectName}',
            project.projectDetail,
          ),
          // hoverColor: AppColors.overlayHover,
          borderRadius: BorderRadius.circular(AppSpacing.projectCardRadius),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Dark header band ──────────────────────────────────────
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(AppSpacing.projectCardRadius),
                ),
                child: Container(
                  height: headerHeight,
                  width: double.infinity,
                  color: AppColors.lightPrimary,
                  child: Center(
                    child: Image.asset(
                      project.imageAsset,
                      height: iconSize,
                      // Render icon as white silhouette on the dark background.
                      color: AppColors.lightBackground,
                      colorBlendMode: BlendMode.srcIn,
                    ),
                  ),
                ),
              ),

              // ── Content area ──────────────────────────────────────────
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.cardPadding,
                  AppSpacing.md,
                  AppSpacing.cardPadding,
                  AppSpacing.cardPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Category label
                    Text(
                      project.title.toUpperCase(),
                      style: AppTextStyles.labelUppercase,
                    ),
                    const SizedBox(height: AppSpacing.sm),

                    // Project name
                    Text(
                      project.projectName,
                      style: AppTextStyles.cardTitle,
                    ),
                    const SizedBox(height: AppSpacing.sm),

                    // Summary
                    Text(
                      project.projectSummary,
                      style: AppTextStyles.projectCardSummary,
                    ),
                    const SizedBox(height: AppSpacing.md),

                    // CTA
                    Row(
                      children: [
                        Text(
                          'Read Case Study',
                          style: AppTextStyles.label.copyWith(
                            color: AppColors.lightPrimary,
                          ),
                        ),
                        const SizedBox(width: AppSpacing.xs),
                        const Icon(
                          Icons.arrow_forward,
                          size: 14,
                          color: AppColors.lightPrimary,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
