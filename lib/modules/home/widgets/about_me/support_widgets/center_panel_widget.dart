
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
              children: [ Container(
                decoration:  BoxDecoration(
                    border:Border.all(color: Colors.blueAccent),
                    // gradient: LinearGradient(colors: [Colors.red,Colors.black]),
                    borderRadius: BorderRadius.circular(360.0)
                ),
                height: 890.0,
                width: 660.0,
                padding: EdgeInsets.all(32),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(360.0), // Adjust the radius as needed
                  child: Image.asset(
                    'images/Simo.jpeg',
                    height: 850.0,
                    width: 600.0,
                    fit: BoxFit.cover,
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