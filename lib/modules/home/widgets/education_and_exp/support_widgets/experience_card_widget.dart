import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/models/experience_item.dart';
import '../../../../core/theme/app_text_styles.dart';
import 'experience_card_item_widget.dart';

class ExperienceCardWidget extends StatelessWidget {
  final String title;
  final List<ExperienceItem> experiences;
  final double cardElevation;

  const ExperienceCardWidget({super.key, required this.title,required this.experiences, required this.cardElevation });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
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
            color: Colors.white,
            surfaceTintColor: Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(45)), // Sharp corners
            ),
            child: Container(
              padding: const EdgeInsets.all(16),
              width: MediaQuery.of(context).size.width/4,
              height: 500,
              child: ListView.builder(
                itemCount: experiences.length,
                itemBuilder: (context, index) => ExperienceCardItem(
                  experience: experiences[index],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
