import 'package:flutter/material.dart';

import 'social_item_widget.dart';

class SocialSectionWidget extends StatelessWidget {
  final Color originalColor;
  const SocialSectionWidget({super.key, required this.originalColor});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SocialItemWidget(
            imageUrl: "images/icons/icons8-twitter-96.png",
            originalColor: originalColor),
        SizedBox(
          width: 30,
        ),
        SocialItemWidget(
            imageUrl: "images/icons/icons8-facebook-96.png",
            originalColor: originalColor,),
        SizedBox(
          width: 30,
        ),
        SocialItemWidget(
            imageUrl: "images/icons/icons8-at-sign-96.png",
          originalColor: originalColor,),
        SizedBox(
          width: 30,
        ),
        SocialItemWidget(
            imageUrl: "images/icons/icons8-google-96.png",
          originalColor: originalColor,),
        SizedBox(
          width: 30,
        ),
      ],
    );
  }
}
