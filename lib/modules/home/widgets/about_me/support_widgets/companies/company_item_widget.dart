import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simo_personal_website/modules/home/widgets/about_me/support_widgets/companies/company_greyscale_hover_image_modifier.dart';

import '../../../../../core/constants/light_color_constant.dart';
import '../../../skills/support_widgets/greyscale_hover_image_modifier.dart';

class CompanyItemWidget extends StatefulWidget {
  final String imageUrl;

  const CompanyItemWidget({super.key, required this.imageUrl,});

  @override
  State<CompanyItemWidget> createState() => _CompanyItemWidgetState();
}

class _CompanyItemWidgetState extends State<CompanyItemWidget> {
  Color colorOverlay = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration( borderRadius: BorderRadius.circular(360.0)),
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 32),
            child: Column(
              children: [
                Center(
                  child: CompanyGrayscaleHoverImage(
                    imageUrl: widget.imageUrl,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
