import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';

class PdfButton extends StatelessWidget {
  const PdfButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () async {
        const String releasePath = kDebugMode ? '' : 'assets/';
        final Uri pdfUri = Uri.base.resolve(
          '${releasePath}assets/pdf/onesimo_nyathi_cv_2024.pdf',
        );
        if (await canLaunchUrl(pdfUri)) {
          await launchUrl(pdfUri);
        }
      },
      icon: const Icon(
        Icons.picture_as_pdf_sharp,
        color: AppColors.lightBackground,
        size: 18,
      ),
      label: const Text('View Resume'),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.lightPrimary,
        foregroundColor: AppColors.lightBackground,
        textStyle: AppTextStyles.navItem,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.lg,
        ),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.xl),
        ),
      ),
    );
  }
}
