import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/util/responsive.dart';
import '../../pdp_and_projects/support_widgets/work_detail_popup.dart';

const int _kPreviewLimit = 750;

class AboutMeLeftPanelWidgetItem extends StatelessWidget {
  final String title;
  final String detail;

  const AboutMeLeftPanelWidgetItem({
    super.key,
    required this.title,
    required this.detail,
  });

  @override
  Widget build(BuildContext context) {
    final titleGap = Responsive.value<double>(
      context,
      mobile: 8.0,
      tablet: 20.0,
      desktop: AppSpacing.aboutItemTitleGap,
    );
    final detailGap = Responsive.value<double>(
      context,
      mobile: 20.0,
      tablet: 36.0,
      desktop: AppSpacing.aboutItemDetailGap,
    );

    final bool truncated = detail.length > _kPreviewLimit;
    final String preview = truncated
        ? '${detail.substring(0, _kPreviewLimit)}...'
        : detail;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title.toUpperCase(), style: AppTextStyles.labelUppercase),
        SizedBox(height: titleGap),
        Text(preview, style: AppTextStyles.bodyR(context)),
        // Both the spacing and the button are guarded by the same condition.
        if (truncated) ...[
          SizedBox(height: titleGap),
          OutlinedButton.icon(
            onPressed: () => WorkDetailPopup.showWorkDetailPopup(
              context,
              title,
              detail,
            ),
            icon: const Icon(Icons.read_more, size: 18),
            label: const Text('Read more'),
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.lightPrimary,
              side: const BorderSide(color: AppColors.lightPrimary),
              textStyle: AppTextStyles.navItem,
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.md,
                vertical: AppSpacing.sm,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSpacing.cardPadding),
              ),
            ),
          ),
        ],
        SizedBox(height: detailGap),
      ],
    );
  }
}
