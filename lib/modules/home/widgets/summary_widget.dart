import 'package:flutter/material.dart';

import '../../core/constants/light_color_constant.dart';

class SummaryWidget extends StatelessWidget {
  const SummaryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 18.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8.0)), color: lightCardBackgroundColor),
                height: 250
            ),
            SizedBox(height: 18,),
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8.0)), color: lightCardBackgroundColor),
                height: 400
            ),
          ],
        ),
      ),
    );
  }
}
