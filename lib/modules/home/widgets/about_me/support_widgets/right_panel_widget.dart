import 'package:flutter/material.dart';
import 'right_panel_item_widget.dart';

class AboutMeRightPanelWidget extends StatelessWidget {
  const AboutMeRightPanelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          AboutMeRightPanelWidgetItem(title: "Years of\nExperience", detail: "7+",),
          AboutMeRightPanelWidgetItem(title: "Companies\nWorked For", detail: "4",),
          AboutMeRightPanelWidgetItem(title: "Corporate Projects", detail: "8",),
        ],
      ),
    );
  }
}