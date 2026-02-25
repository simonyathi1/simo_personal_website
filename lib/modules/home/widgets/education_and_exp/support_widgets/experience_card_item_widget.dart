import 'package:flutter/material.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/models/experience_item.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/util/responsive.dart';

class ExperienceCardItem extends StatelessWidget {
  final ExperienceItem experience;

  const ExperienceCardItem({super.key, required this.experience});

  @override
  Widget build(BuildContext context) {
    final vPad = Responsive.value<double>(
      context,
      mobile: AppSpacing.md,
      tablet: AppSpacing.md,
      desktop: AppSpacing.md,
    );
    final titleStyle = Responsive.value(
      context,
      mobile: AppTextStyles.cardTitle.copyWith(fontSize: 18),
      tablet: AppTextStyles.cardTitle,
      desktop: AppTextStyles.cardTitle,
    );

    return Padding(
      padding: EdgeInsets.symmetric(vertical: vPad),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(experience.role, style: titleStyle, textAlign: TextAlign.center),
          Text(experience.organisation, style: AppTextStyles.label, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
