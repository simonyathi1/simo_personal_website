import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import 'support_widgets/center_panel_widget.dart';
import 'support_widgets/companies/companies_widget.dart';
import 'support_widgets/left_panel_widget.dart';
import 'support_widgets/pdf_button.dart';
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
              child: AboutMeLeftPanelWidget(),
            ),
            Expanded(
              flex: 8,
              child: Container(
                color: AppColors.lightBackground,
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
        const CompaniesWidget(),
      ],
    );
  }
}
