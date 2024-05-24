import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:simo_personal_website/modules/home/widgets/skills/support_widgets/skill_item_widget.dart';

import 'company_item_widget.dart';

class CompaniesWidget extends StatelessWidget {
  const CompaniesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 80,
        ),
        Card(
          elevation: 16,
          color: Colors.white,
          surfaceTintColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(180)), // Sharp corners
          ),
          child: Container(
            decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8.0))),
            height: 120,
            child: const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CompanyItemWidget(imageUrl: "assets/images/companies/reverside-big.png",),
                  CompanyItemWidget(imageUrl: "assets/images/companies/absa.png",),
                  CompanyItemWidget(imageUrl: "assets/images/companies/fidelitech-logo.png",),
                  CompanyItemWidget(imageUrl: "assets/images/companies/dvt.png",),
                  CompanyItemWidget(imageUrl: "assets/images/companies/mukuru-big.png",),
                  CompanyItemWidget(imageUrl: "assets/images/companies/standard-bank-logo.png",),
                  CompanyItemWidget(imageUrl: "assets/images/companies/discovery.png",),
                  CompanyItemWidget(imageUrl: "assets/images/companies/vitality-logo.png",),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
