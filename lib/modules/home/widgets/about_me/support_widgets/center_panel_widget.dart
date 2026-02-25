import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_spacing.dart';

class AboutMeCenterPanelWidget extends StatelessWidget {
  const AboutMeCenterPanelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.aboutPanelPadding),
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Derive image dimensions from available width so the panel
          // never overflows on narrow viewports.
          final availableW = constraints.maxWidth.isInfinite
              ? AppSpacing.mainImageWidthBorder
              : constraints.maxWidth;

          final borderSize = availableW * 0.9;
          final imageSize  = borderSize * 0.85;

          return Column(
            children: [
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      'assets/images/logo/pattern3.png',
                      color: CupertinoColors.inactiveGray,
                      width: borderSize,
                    ),
                    Image.asset(
                      'assets/images/logo/pattern6.png',
                      color: CupertinoColors.inactiveGray.withOpacity(0.5),
                      width: borderSize,
                    ),
                    SizedBox(
                      width: borderSize,
                      height: borderSize * (AppSpacing.mainImageHeightBorder / AppSpacing.mainImageWidthBorder),
                      child: Padding(
                        padding: const EdgeInsets.all(AppSpacing.xl),
                        child: Card(
                          elevation: 32,
                          color: Colors.white,
                          surfaceTintColor: Colors.white,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(AppSpacing.skillCircleRadius),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(360.0),
                              child: Image.asset(
                                'assets/images/Simo.jpeg',
                                width: imageSize,
                                height: imageSize,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
