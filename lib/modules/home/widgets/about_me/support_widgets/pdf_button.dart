import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constants/light_color_constant.dart';

class PdfButton extends StatelessWidget {
  const PdfButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        final Uri pdfUri = Uri.base.resolve('assets/pdf/onesimo_nyathi_cv_2023.pdf');
        if (await canLaunchUrl(pdfUri)) {
          await launchUrl(pdfUri);
        } else {
          throw 'Could not launch assets/pdf/onesimo_nyathi_cv_2023.pdf';
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(width: 20, child: Image.asset('assets/images/logo/pdf-logo.png')),
            const Text(
              "View my Resume",
              style: TextStyle(color: lightSecondaryColor, fontSize: 13, fontFamily: 'Montserrat'),
            ),
          ],
        ),
      ),
    );
  }
}
