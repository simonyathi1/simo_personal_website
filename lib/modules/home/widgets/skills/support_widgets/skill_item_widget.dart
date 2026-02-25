import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/models/skill_item.dart';
import '../../../../core/theme/app_text_styles.dart';

import 'greyscale_hover_image_modifier.dart';

class SkillItemWidget extends StatefulWidget {
  final SkillItem skill;

  const SkillItemWidget({super.key, required this.skill});

  @override
  State<SkillItemWidget> createState() => _SkillItemWidgetState();
}

class _SkillItemWidgetState extends State<SkillItemWidget> {
  Color colorOverlay = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: AppSpacing.skillCardMarginH),
      child: Column(
        children: [
          Card(
            elevation: 16,
            color: Colors.white,
            surfaceTintColor: Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(180)), // Sharp corners
            ),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.lightCardBackground),
                  borderRadius: BorderRadius.circular(AppSpacing.skillCircleRadius),
                  color: AppColors.lightCardBackground),
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.skillCirclePaddingH,
                vertical: AppSpacing.skillCirclePaddingV,
              ),
              child: Column(
                children: [
                  Center(
                    child: GrayscaleHoverImage(
                      imageUrl: widget.skill.imageAsset,
                    ),
                  ),
                  Text(
                    '${widget.skill.level} %',
                    style: AppTextStyles.skillPercent,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.skillNameGap),
          Text(widget.skill.name, style: AppTextStyles.skillName),
        ],
      ),
    );
  }
}
