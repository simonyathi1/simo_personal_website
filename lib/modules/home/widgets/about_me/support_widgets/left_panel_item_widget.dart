import 'package:flutter/material.dart';
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
    final titleGap  = Responsive.value<double>(
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
        if (truncated)
          SizedBox(height: titleGap),
          TextButton(
            onPressed: () => WorkDetailPopup.showWorkDetailPopup(
              context,
              title,
              detail,
            ),
            style: TextButton.styleFrom(padding: EdgeInsets.zero),
            child: const Padding(
              padding: EdgeInsets.all(AppSpacing.sm),
              child: Text('Read more', style: AppTextStyles.label,),
            ),
          ),
        SizedBox(height: detailGap),
      ],
    );
  }
}
