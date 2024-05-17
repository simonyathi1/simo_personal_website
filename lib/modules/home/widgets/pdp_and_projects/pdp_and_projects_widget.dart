import 'package:flutter/material.dart';

import '../../../core/constants/light_color_constant.dart';

class PDPAndProjectsWidget extends StatelessWidget {
  const PDPAndProjectsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 20.0, top: 20.0),
          child: Divider(height: 1,thickness: 0.5, color: Colors.black),
        ),
        Text("PDP and Projects", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),),
        Container(
          decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8.0)), color: lightCardBackgroundColor),
          height: 400,
        ),
      ],
    );
  }
}
