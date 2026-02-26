import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';

class WorkDetailPopup {
  static void showWorkDetailPopup(
    BuildContext context,
    String title,
    String detail,
  ) {
    final size = MediaQuery.sizeOf(context);

    showDialog(
      context: context,
      barrierColor: Colors.black54,
      builder: (BuildContext dialogContext) {
        return Center(
          child: Container(
            width: size.width * AppSpacing.popupWidthFractionR(context),
            constraints: BoxConstraints(
              maxHeight: size.height * AppSpacing.popupMaxHeightFraction,
            ),
            // ClipRRect ensures the dark header is clipped to the dialog's radius.
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Material(
                color: AppColors.lightBackground,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // ── Dark header ───────────────────────────────────────
                    Container(
                      color: AppColors.lightPrimary,
                      padding: const EdgeInsets.fromLTRB(
                        AppSpacing.lg,
                        AppSpacing.lg,
                        AppSpacing.sm,
                        AppSpacing.lg,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              title,
                              style: AppTextStyles.cardTitle.copyWith(
                                color: AppColors.lightBackground,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () => Navigator.of(dialogContext).pop(),
                            icon: const Icon(
                              Icons.close,
                              color: AppColors.lightBackground,
                            ),
                            tooltip: 'Close',
                            splashRadius: 20,
                          ),
                        ],
                      ),
                    ),

                    // ── Scrollable body ───────────────────────────────────
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.lg,
                          vertical: AppSpacing.xl,
                        ),
                        child: Text(
                          detail,
                          style: AppTextStyles.popupBody.copyWith(height: 1.75),
                        ),
                      ),
                    ),

                    // ── Footer ────────────────────────────────────────────
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                        AppSpacing.lg,
                        AppSpacing.sm,
                        AppSpacing.lg,
                        AppSpacing.lg,
                      ),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: OutlinedButton.icon(
                          onPressed: () => Navigator.of(dialogContext).pop(),
                          icon: const Icon(Icons.keyboard_arrow_up, size: 16),
                          label: const Text('Dismiss'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppColors.lightPrimary,
                            side: const BorderSide(color: AppColors.lightPrimary),
                            textStyle: AppTextStyles.navItem,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
