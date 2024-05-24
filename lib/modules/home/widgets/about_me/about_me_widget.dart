import 'package:flutter/material.dart';
import 'package:simo_personal_website/modules/home/widgets/about_me/support_widgets/companies/companies_widget.dart';
import 'package:simo_personal_website/modules/home/widgets/about_me/support_widgets/pdf_button.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/constants/light_color_constant.dart';
import 'support_widgets/center_panel_widget.dart';
import 'support_widgets/left_panel_widget.dart';
import 'support_widgets/right_panel_widget.dart';

class AboutMeWidget extends StatelessWidget {
  const AboutMeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Expanded(
              flex: 2,
              child: SizedBox(
                child: AboutMeLeftPanelWidget(),
              ),
            ),
            Expanded(
              flex: 8,
              child: Container(
                color: Colors.white,
                child: const AboutMeCenterPanelWidget(),
              ),
            ),
            const Expanded(
              flex: 2,
              child: AboutMeRightPanelWidget(),
            ),
          ],
        ),
        const SizedBox(
          width: 200,
          child: PdfButton(),
        ),
        const CompaniesWidget()
      ],
    );
  }
}
