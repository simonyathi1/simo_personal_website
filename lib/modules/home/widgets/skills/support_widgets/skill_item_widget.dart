import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/models/skill_item.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/util/responsive.dart';
import '../../common/greyscale_hover_image_modifier.dart';

class SkillItemWidget extends StatelessWidget {
  final SkillItem skill;

  const SkillItemWidget({super.key, required this.skill});

  @override
  Widget build(BuildContext context) {
    final cardWidth   = AppSpacing.skillCardWidthR(context);
    final imageSize   = cardWidth * 0.72;
    final vPadding    = Responsive.value<double>(
      context,
      mobile: 14.0,
      tablet: 22.0,
      desktop: AppSpacing.skillCirclePaddingV,
    );

    return Container(
      width: cardWidth,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: AppSpacing.skillCardMarginH),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Card(
            elevation: 16,
            color: AppColors.lightBackground,
            surfaceTintColor: AppColors.lightBackground,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(AppSpacing.skillCircleRadius),
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.lightCardBackground),
                borderRadius:
                    BorderRadius.circular(AppSpacing.skillCircleRadius),
                color: AppColors.lightCardBackground,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacing.skillCirclePaddingH,
                vertical: vPadding,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GrayscaleHoverImage(
                    imageUrl: skill.imageAsset,
                    width: imageSize,
                    height: imageSize,
                  ),
                  Text(
                    '${skill.level} %',
                    style: AppTextStyles.skillPercentR(context),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.skillNameGap),
          Text(skill.name, style: AppTextStyles.skillName),
        ],
      ),
    );
  }
}
