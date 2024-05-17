import 'package:flutter/material.dart';
import '../../../../core/constants/light_color_constant.dart';

class AboutMeRightPanelWidgetItem extends StatelessWidget {
  final String title;
  final String detail;
  const AboutMeRightPanelWidgetItem({super.key, required this.title, required this.detail});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(title.toUpperCase(), style: const TextStyle(color: Colors.grey, fontSize: 13, fontFamily: 'Montserrat'), textAlign: TextAlign.end,),
          const SizedBox(height: 38,),
          Text(detail, style: const TextStyle(color: lightSecondaryColor, fontSize: 65,), textAlign: TextAlign.end,),
          const SizedBox(height: 64,),
        ],
      ),
    );
  }
}