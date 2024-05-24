import 'package:flutter/material.dart';
import 'package:simo_personal_website/modules/home/widgets/navigation/common/social_section_widget.dart';

import '../../../../core/constants/light_color_constant.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [ const Padding(
        padding: EdgeInsets.only(bottom: 20.0, top: 20.0),
        child: Divider(height: 1,thickness: 0.5, color: Colors.black),
      ),
        Container(
          padding: const EdgeInsets.all(18),
          height: 100,
          //color: lightSecondaryColor,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("© 2024. Onesimo Nyathi, by FideliTech", style: TextStyle(color: lightSecondaryColor, fontFamily: 'Montserrat'),),
              Column(
                children: [
                  // Text("simonyathi1@gmail.com", style: TextStyle(color: lightSecondaryColor, fontFamily: 'Montserrat'),),
                  // Text("onesimonyathi@fidelitech.co.za", style: TextStyle(color: lightSecondaryColor, fontFamily: 'Montserrat'),),
                ],
              ),
              SocialSectionWidget(originalColor: lightSecondaryColor,)
            ],
          ),
        ),
      ],
    );
  }
}
