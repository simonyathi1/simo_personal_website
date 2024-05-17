import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/light_color_constant.dart';

class SkillItemWidget extends StatefulWidget {
  final String imageUrl;
  final String skill;
  final int skillLevel;

  const SkillItemWidget({super.key, required this.imageUrl, required this.skill, required this.skillLevel});

  @override
  State<SkillItemWidget> createState() => _SkillItemWidgetState();
}

class _SkillItemWidgetState extends State<SkillItemWidget> {
  Color colorOverlay = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 225,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 30,),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(border: Border.all(color: lightCardBackgroundColor), borderRadius: BorderRadius.circular(360.0), color: lightCardBackgroundColor),
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 32),
            child: Column(
              children: [
                InkWell(
                  onHover: (x) {
                    setState(() {
                      if (x) {
                        colorOverlay = Colors.transparent;
                      } else {
                        colorOverlay = const Color(0x38676767);
                      }
                    });
                  },
                  hoverColor: Colors.transparent,
                  child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: lightCardBackgroundColor),
                        borderRadius: BorderRadius.circular(360.0),
                      ),
                      padding: const EdgeInsets.all(25),
                      constraints: BoxConstraints.tight(const Size.fromHeight(170)),
                      width: 200,
                      child: Image.asset(widget.imageUrl, color: colorOverlay,)),
                ),
                Text(
                  "${widget.skillLevel} %",
                  style: const TextStyle(fontSize: 45),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 22,
          ),
          Text(
            widget.skill,
            style: const TextStyle(fontSize: 16, fontFamily: "Montserrat", fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
