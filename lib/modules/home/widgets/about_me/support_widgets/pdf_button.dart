import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class PdfButton extends StatelessWidget {
  const PdfButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        String releasePath = kDebugMode ? '': 'assets/';
        final Uri pdfUri = Uri.base.resolve('${releasePath}assets/pdf/onesimo_nyathi_cv_2024.pdf');
        if (await canLaunchUrl(pdfUri)) {
          await launchUrl(pdfUri);
        } else {
          throw 'Could not launch assets/pdf/onesimo_nyathi_cv_2024.pdf';
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(width: 20, child: Image.asset('assets/images/logo/pdf-logo.png')),
            const Text('View my Resume', style: AppTextStyles.body),
          ],
        ),
      ),
    );
  }
}
