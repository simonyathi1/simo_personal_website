import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:simo_personal_website/modules/core/widget_data_builder/experience_card_data.dart';
import 'package:simo_personal_website/modules/core/widget_data_builder/project_card_data.dart';

import '../../../core/constants/light_color_constant.dart';
import 'support_widgets/project_card_widget.dart';

class PDPAndProjectsWidget extends StatelessWidget {
  const PDPAndProjectsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final experienceCardData = ExperienceCardData();
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 20.0, top: 20.0),
          child: Divider(height: 1, thickness: 0.5, color: Colors.black),
        ),
        const SizedBox(
          height: 40,
        ),
        const Text(
          "Projects & Personal Development",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 40),
        ),
        const SizedBox(
          height: 40,
        ),
        Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Center(
                child: Image.asset(
                  'assets/images/logo/pattern5.png',
                  color: CupertinoColors.inactiveGray,
                ),
              ),
            ),
            SizedBox(
              height: 550,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(child: ProjectCardWidget(projectItemModel: ProjectCardData().work, cardElevation: 8)),
                  Expanded(child: ProjectCardWidget(projectItemModel: ProjectCardData().pdp, cardElevation: 22)),
                  Expanded(child: ProjectCardWidget(projectItemModel: ProjectCardData().personal, cardElevation: 8)),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
