import 'package:flutter/material.dart';

import '../../../core/constants/light_color_constant.dart';

class WidgetPlaygroundWidget extends StatelessWidget {
  const WidgetPlaygroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Widget Playground", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 40),),
        Container(
          decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8.0)), color: lightCardBackgroundColor),
          height: 400,
        ),
      ],
    );
  }
}
