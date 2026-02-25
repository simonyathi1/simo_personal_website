import 'package:flutter/material.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';

class WorkDetailPopup {
  static void showWorkDetailPopup(
    BuildContext context,
    String title,
    String detail,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Container(
            width: MediaQuery.sizeOf(context).width *
                AppSpacing.popupWidthFractionR(context),
            constraints: BoxConstraints(
              maxHeight: MediaQuery.sizeOf(context).height *
                  AppSpacing.popupMaxHeightFraction,
            ),
            child: Material(
              borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(AppSpacing.cardPadding),
                    child: Text(title, style: AppTextStyles.cardTitle),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.cardPadding,
                        ),
                        child: Text(detail, style: AppTextStyles.popupBody),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(AppSpacing.cardPadding),
                    child: ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Dismiss', style: AppTextStyles.navItem),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
