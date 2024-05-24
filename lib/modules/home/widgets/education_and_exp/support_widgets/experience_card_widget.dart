import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simo_personal_website/modules/core/constants/light_color_constant.dart';
import 'package:simo_personal_website/modules/home/widgets/education_and_exp/support_widgets/experience_card_item_widget.dart';

import '../../../../core/models/framework_models/experience/experience_item_model.dart';

class ExperienceCardWidget extends StatelessWidget {
  final String title;
  final List<ExperienceItemModel> experiences;
  final double cardElevation;

  const ExperienceCardWidget({super.key, required this.title,required this.experiences, required this.cardElevation });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
            child: Text(title.toUpperCase(), style: const TextStyle(color: lightGreyColor, fontSize: 13, fontWeight: FontWeight.w600, fontFamily: 'Montserrat'), textAlign: TextAlign.start,),
          ),
          Card(
            elevation: cardElevation,
            color: Colors.white,
            surfaceTintColor: Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(45)), // Sharp corners
            ),
            child: Container(
              padding: const EdgeInsets.all(16),
              width: MediaQuery.of(context).size.width/4,
              height: 500,
              child: ListView.builder(
                  itemCount: experiences.length,
                  itemBuilder: (context, index) => ExperienceCardItem(what: experiences[index].what, where: experiences[index].where)),
            ),
          ),
        ],
      ),
    );
  }
}
