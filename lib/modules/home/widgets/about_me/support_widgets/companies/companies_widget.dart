import 'package:flutter/material.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_spacing.dart';
import 'company_item_widget.dart';

class CompaniesWidget extends StatelessWidget {
  const CompaniesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: AppSpacing.sectionTitleTop),
        Card(
          elevation: 16,
          color: AppColors.lightBackground,
          surfaceTintColor: AppColors.lightBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(AppSpacing.skillCircleRadius)),
          ),
          child: SizedBox(
            height: AppSpacing.companiesBannerHeight,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CompanyItemWidget(imageUrl: 'assets/images/companies/reverside-big.png'),
                  CompanyItemWidget(imageUrl: 'assets/images/companies/absa.png'),
                  CompanyItemWidget(imageUrl: 'assets/images/companies/fidelitech-logo.png'),
                  CompanyItemWidget(imageUrl: 'assets/images/companies/dvt.png'),
                  CompanyItemWidget(imageUrl: 'assets/images/companies/mukuru-big.png'),
                  CompanyItemWidget(imageUrl: 'assets/images/companies/standard-bank-logo.png'),
                  CompanyItemWidget(imageUrl: 'assets/images/companies/discovery.png'),
                  CompanyItemWidget(imageUrl: 'assets/images/companies/vitality-logo.png'),
                  CompanyItemWidget(imageUrl: 'assets/images/icons/yoco-logo.png'),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
