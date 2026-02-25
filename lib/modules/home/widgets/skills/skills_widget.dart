import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/content/portfolio_content.dart';
import '../../../core/theme/app_text_styles.dart';
import 'support_widgets/skill_item_widget.dart';

class SkillsWidget extends StatelessWidget {
  const SkillsWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
          'My Skills and Abilities',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 40 ),
        ),
        const SizedBox(
          height: 80,
        ),
        Stack(
          children: [
            Center(
              child: SizedBox(
                height: 400,
                child: Image.asset(
                  'assets/images/logo/pattern5.png',
                  color: CupertinoColors.inactiveGray,
                ),
              ),
            ),
            Center(
              child: Container(
                decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8.0))),
                height: 400,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      for (final skill in PortfolioContent.skills)
                      SkillItemWidget(skill: skill),
                      ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
