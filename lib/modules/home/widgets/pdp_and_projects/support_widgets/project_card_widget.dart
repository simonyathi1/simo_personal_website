import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:simo_personal_website/modules/core/constants/light_color_constant.dart';
import 'package:simo_personal_website/modules/core/models/framework_models/projects/project_item_model.dart';
import 'package:simo_personal_website/modules/core/widget_data_builder/project_card_data.dart';
import 'package:simo_personal_website/modules/home/widgets/education_and_exp/support_widgets/experience_card_item_widget.dart';
import 'package:simo_personal_website/modules/home/widgets/pdp_and_projects/support_widgets/work_detail_popup.dart';

import '../../../../core/models/framework_models/experience/experience_item_model.dart';

class ProjectCardWidget extends StatelessWidget {
  final ProjectItemModel projectItemModel;
  final double cardElevation;

  const ProjectCardWidget({super.key, required this.projectItemModel, required this.cardElevation});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        WorkDetailPopup.showWorkDetailPopup(
          context,
          "${projectItemModel.title}: ${projectItemModel.projectName}",
          projectItemModel.projectDetail
           );
      },
      hoverColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
              child: Text(
                projectItemModel.title,
                style: const TextStyle(color: lightGreyColor, fontSize: 13, fontWeight: FontWeight.w600, fontFamily: 'Montserrat'),
                textAlign: TextAlign.start,
              ),
            ),
            Card(
              elevation: cardElevation,
              color: Colors.white,
              surfaceTintColor: Colors.white,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(45)), // Sharp corners
              ),
              child: Container(
                width: MediaQuery.of(context).size.width / 4,
                height: 430,
                child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 300,
                            child: Image.asset("assets/images/logo/pattern3.png", color: Colors.blueGrey.withOpacity(0.3),),
                          ),
                          Center(
                            child: Container(
                              padding: const EdgeInsets.all(50),
                              height: 300,
                              child: Image.asset(projectItemModel.imageUrl,),
                            ),
                          ),
                          Center(
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(topLeft: Radius.circular(45.0), topRight: Radius.circular(45.0)),
                              child: Container(
                                color: Colors.black38.withOpacity(0.3),
                                height: 300,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 4,
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Current Project: ",  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500,fontFamily: 'Montserrat', color: Colors.black.withOpacity(0.65)), textAlign: TextAlign.start,),
                            Text(projectItemModel.projectName,  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, fontFamily: 'Montserrat'), textAlign: TextAlign.start,),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                        child: Text(
                          projectItemModel.projectSummary,
                          style: TextStyle(color: Colors.black.withOpacity(0.75), fontSize: 12, fontWeight: FontWeight.w500, fontFamily: 'Montserrat'),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
