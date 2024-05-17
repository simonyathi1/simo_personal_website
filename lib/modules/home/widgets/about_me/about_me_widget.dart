import 'package:flutter/material.dart';
import 'support_widgets/center_panel_widget.dart';
import 'support_widgets/left_panel_widget.dart';
import 'support_widgets/right_panel_widget.dart';

class AboutMeWidget extends StatelessWidget {
  const AboutMeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
          const Expanded(
            flex: 2,
            child: SizedBox(
              child: AboutMeLeftPanelWidget(),
            ),
          ),
        Expanded(
          flex: 8,
          child: Container(color: Colors.white,child: const AboutMeCenterPanelWidget(),),
        ),
          const Expanded(
            flex: 2,
            child: AboutMeRightPanelWidget(),
          ),
      ],
    );
  }
}







