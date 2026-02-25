import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/models/experience_item.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/util/responsive.dart';
import 'experience_card_item_widget.dart';

class ExperienceCardWidget extends StatelessWidget {
  final String title;
  final List<ExperienceItem> experiences;
  final double cardElevation;

  const ExperienceCardWidget({
    super.key,
    required this.title,
    required this.experiences,
    required this.cardElevation,
  });

  @override
  Widget build(BuildContext context) {
    final vPad = Responsive.value<double>(
      context,
      mobile: 1.0,
      tablet: 1,
      desktop: 4.0,
    );
    final rowHeight = AppSpacing.experienceRowHeightR(context);
    final cardHeight = AppSpacing.experienceRCardHeightR(context);

    final  List<Widget>experienceCards= [];

    for (final exp in experiences) {
      experienceCards.add(ExperienceCardItem(experience: exp));
    }
    return Container(
      height: rowHeight,
      padding: const EdgeInsets.all(AppSpacing.cardPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: AppSpacing.sm,
              bottom: AppSpacing.xs,
            ),
            child: Text(
              title.toUpperCase(),
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
            child: Container(
              // color: Colors.blue,
              height: cardHeight,
              width: MediaQuery.of(context).size.width/vPad,
              padding: const EdgeInsets.all(AppSpacing.cardPadding),
              child: Column(
                children: experienceCards,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
