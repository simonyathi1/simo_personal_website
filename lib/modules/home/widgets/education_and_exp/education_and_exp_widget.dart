import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simo_personal_website/modules/home/widgets/education_and_exp/support_widgets/experience_card_widget.dart';
import '../../../core/widget_data_builder/experience_card_data.dart';

class EducationAndExperienceWidget extends StatelessWidget {
  const EducationAndExperienceWidget({super.key});

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
          height: 80,
        ),
        const Text(
          "Education & Experience",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 40),
        ),
        const SizedBox(
          height: 80,
        ),
        Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Center(
                child: Image.asset(
                  'assets/images/logo/pattern5.png',
                  color: CupertinoColors.inactiveGray,
                ),
              ),
            ),
            SizedBox(
              height: 600,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(child: ExperienceCardWidget(title: "Education: 2011 - 2016", experiences: experienceCardData.education, cardElevation: 4)),
                  Expanded(child: ExperienceCardWidget(title: "2017 - 2018", experiences: experienceCardData.exp1, cardElevation: 8)),
                  Expanded(child: ExperienceCardWidget(title: "2019 - 2021", experiences: experienceCardData.exp2, cardElevation: 16)),
                  Expanded(child: ExperienceCardWidget(title: "2021 - Present", experiences: experienceCardData.exp3, cardElevation: 32)),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
