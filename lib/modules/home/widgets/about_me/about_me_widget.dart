import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/util/responsive.dart';
import 'support_widgets/center_panel_widget.dart';
import 'support_widgets/companies/companies_widget.dart';
import 'support_widgets/left_panel_widget.dart';
import 'support_widgets/pdf_button.dart';
import 'support_widgets/right_panel_widget.dart';

class AboutMeWidget extends StatelessWidget {
  const AboutMeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final availableW = constraints.maxWidth.isInfinite
            ? AppSpacing.mainImageWidthBorder
            : constraints.maxWidth;

        return Stack(
          children: [
            Image.asset(
              'assets/images/logo/pattern3.png',
              color: CupertinoColors.inactiveGray.withValues(alpha: 0.3),
              width: availableW,
            ),
            Image.asset(
              'assets/images/logo/pattern6.png',
              color: CupertinoColors.inactiveGray.withValues(alpha: 0.2),
              width: availableW,
            ),
            Column(
              children: [
                ResponsiveLayout(
                  mobile: (_) => const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Profile photo
                      AboutMeCenterPanelWidget(),
                      // Compact stats strip (7+ | 4 | 8)
                      AboutMeRightPanelWidget(),
                      // Bio / Contact / Services text
                      AboutMeLeftPanelWidget(),
                    ],
                  ),
                  tablet: (_) => Row(
                    children: [
                      const Expanded(flex: 3, child: AboutMeLeftPanelWidget()),
                      Expanded(
                        flex: 6,
                        child: Container(
                          color: AppColors.lightBackground,
                          child: const AboutMeCenterPanelWidget(),
                        ),
                      ),
                      const Expanded(flex: 3, child: AboutMeRightPanelWidget()),
                    ],
                  ),
                  desktop: (_) => Row(
                    children: [
                      const Expanded(flex: 6, child: AboutMeLeftPanelWidget()),
                      Expanded(
                        flex: 8,
                        child: Container(
                          color: AppColors.transparent,
                          child: const AboutMeCenterPanelWidget(),
                        ),
                      ),
                      const Expanded(flex: 6, child: AboutMeRightPanelWidget()),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 200,
                  child: PdfButton(),
                ),
                const CompaniesWidget(),
              ],
            ),
          ],
        );
      }
    );
  }
}
