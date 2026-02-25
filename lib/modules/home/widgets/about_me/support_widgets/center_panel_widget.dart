import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_spacing.dart';

class AboutMeCenterPanelWidget extends StatelessWidget {
  const AboutMeCenterPanelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.aboutPanelPadding),
      child: Column(
        children: [
          Center(
            child: Stack(
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/logo/pattern3.png',
                    color: CupertinoColors.inactiveGray,
                  ),
                ),
                Center(
                  child: Image.asset(
                    'assets/images/logo/pattern6.png',
                    color: CupertinoColors.inactiveGray.withOpacity(0.5),
                  ),
                ),
                Center(
                  child: Container(
                    height: AppSpacing.mainImageHeightBorder,
                    width: AppSpacing.mainImageWidthBorder,
                    padding: const EdgeInsets.all(32),
                    child: Card(
                      elevation: 32,
                      color: Colors.white,
                      surfaceTintColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(AppSpacing.skillCircleRadius)), // Sharp corners
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(360.0), // Adjust the radius as needed
                          child: Image.asset(
                            'assets/images/Simo.jpeg',
                            height: AppSpacing.mainImageHeight,
                            width: AppSpacing.mainImageWidth,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
