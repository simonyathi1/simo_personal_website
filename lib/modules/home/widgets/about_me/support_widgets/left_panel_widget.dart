import 'package:flutter/material.dart';
import 'left_panel_item_widget.dart';

class AboutMeLeftPanelWidget extends StatelessWidget {
  const AboutMeLeftPanelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          AboutMeLeftPanelWidgetItem(title: "Biography", detail: "I get paid to solve problems using various Mobile Application development tools. I am a very driven and ambitious person with an exceptional love for learning, growth, and continuous improvement",),
          AboutMeLeftPanelWidgetItem(title: "Contact", detail: "Johannesburg, SA\nsimonyathi@gmail.com\n(+27) 73 071 2536",),
          AboutMeLeftPanelWidgetItem(title: "Services", detail: "Android Development\nFlutter Development\nMobile Architect",),
        ],
      ),
    );
  }
}