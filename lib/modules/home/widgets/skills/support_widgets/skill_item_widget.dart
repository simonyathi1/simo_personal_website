import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/models/skill_item.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../common/greyscale_hover_image_modifier.dart';

class SkillItemWidget extends StatelessWidget {
  final SkillItem skill;

  const SkillItemWidget({super.key, required this.skill});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSpacing.skillCardWidth,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: AppSpacing.skillCardMarginH),
      child: Column(
        children: [
          Card(
            elevation: 16,
            color: AppColors.lightBackground,
            surfaceTintColor: AppColors.lightBackground,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(AppSpacing.skillCircleRadius)),
            ),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.lightCardBackground),
                borderRadius: BorderRadius.circular(AppSpacing.skillCircleRadius),
                color: AppColors.lightCardBackground,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.skillCirclePaddingH,
                vertical: AppSpacing.skillCirclePaddingV,
              ),
              child: Column(
                children: [
                  Center(
                    child: GrayscaleHoverImage(
                      imageUrl: skill.imageAsset,
                    ),
                  ),
                  Text('${skill.level} %', style: AppTextStyles.skillPercent),
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
