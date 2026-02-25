import 'package:flutter/material.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/models/experience_item.dart';
import '../../../../core/theme/app_text_styles.dart';

class ExperienceCardItem extends StatelessWidget {
  final ExperienceItem experience;

  const ExperienceCardItem({super.key, required this.experience});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(experience.role, style: AppTextStyles.cardTitle, textAlign: TextAlign.start),
          Text(experience.organisation, style: AppTextStyles.label, textAlign: TextAlign.start),
        ],
      ),
    );
  }
}
