import 'package:flutter/material.dart';
import '../../../../../core/constants/app_spacing.dart';
import 'company_greyscale_hover_image_modifier.dart';

class CompanyItemWidget extends StatelessWidget {
  final String imageUrl;

  const CompanyItemWidget({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSpacing.companyItemWidth,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration( borderRadius: BorderRadius.circular(360.0)),
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.skillCirclePaddingH,
              vertical: AppSpacing.skillCirclePaddingV,
            ),
            child: Column(
              children: [
                Center(
                  child: CompanyGrayscaleHoverImage(
                    imageUrl: imageUrl,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
