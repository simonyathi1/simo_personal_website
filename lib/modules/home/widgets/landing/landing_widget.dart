
import 'package:flutter/material.dart';

class LandingWidget extends StatelessWidget {
  const LandingWidget({super.key});
  static const LANDING_TITLE = "Onesimo Nyathi\nSnr Android & Flutter Developer\nBased in Johannesburg, SA";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18),
      child: Container(
        padding: const EdgeInsets.all(80),
        child: const Text(LANDING_TITLE, style: TextStyle(fontSize: 80, height: 1), textAlign: TextAlign.center,),
      ),
    );
  }
}
