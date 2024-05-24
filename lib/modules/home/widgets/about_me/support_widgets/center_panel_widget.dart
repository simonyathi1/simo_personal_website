import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutMeCenterPanelWidget extends StatelessWidget {
  const AboutMeCenterPanelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
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
                    height: 890.0,
                    width: 660.0,
                    padding: const EdgeInsets.all(32),
                    child: Card(
                      elevation: 32,
                      color: Colors.white,
                      surfaceTintColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(360)), // Sharp corners
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(360.0), // Adjust the radius as needed
                          child: Image.asset(
                            'assets/images/Simo.jpeg',
                            height: 850.0,
                            width: 600.0,
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
