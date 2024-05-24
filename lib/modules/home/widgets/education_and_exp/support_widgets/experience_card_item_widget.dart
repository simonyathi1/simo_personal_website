import 'package:flutter/material.dart';

import '../../../../core/constants/light_color_constant.dart';

class ExperienceCardItem extends StatelessWidget {
  final String what;
  final String where;

  const ExperienceCardItem({super.key, required this.what, required this.where});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(what, style: const TextStyle(fontSize: 23, fontWeight: FontWeight.w600), textAlign: TextAlign.start,),
          Text(where, style: const TextStyle(color: lightGreyColor, fontSize: 13, fontWeight: FontWeight.w500, fontFamily: 'Montserrat'), textAlign: TextAlign.start,),
        ],
      ),
    );
  }
}
