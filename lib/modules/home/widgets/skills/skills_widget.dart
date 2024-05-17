import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:simo_personal_website/modules/home/widgets/skills/support_widgets/skill_item_widget.dart';

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
          "My Skills and Abilities",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 60),
        ),
        const SizedBox(
          height: 80,
        ),
        Container(
          decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8.0))),
          height: 400,
          child: const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SkillItemWidget(imageUrl: "images/logo/android-logo-selected.png", skill: "Android", skillLevel: 89,),
                SkillItemWidget(imageUrl: "images/logo/kotlin-logo.png", skill: "Kotlin", skillLevel: 85,),
                SkillItemWidget(imageUrl: "images/logo/flutter.png", skill: "Flutter", skillLevel: 86,),
                SkillItemWidget(imageUrl: "images/logo/Java-logo.png", skill: "Java", skillLevel: 83,),
                SkillItemWidget(imageUrl: "images/logo/Architecture.png", skill: "Architecture", skillLevel: 45,),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
