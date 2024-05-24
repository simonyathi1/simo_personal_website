
import 'package:flutter/material.dart';

class LandingWidget extends StatelessWidget {
  const LandingWidget({super.key});
  static const LANDING_TITLE = "Hi!\nMy name is Onesimo {Simo} Nyathi.\n a Snr. Android & Flutter Developer\n& a future Mobile Architect";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18),
      child: Stack(
        children: [
          SizedBox(height: 90,
            child: SizedBox(
              child: Row(
                  children: [
                    Image.asset('assets/images/logo/under-construction-worker.png' ,),
                    SizedBox(width: 20,),
                    const Text("This site is under ongoing construction. *Not Mobile-Safe yet", style: TextStyle(fontSize: 12, color: Colors.red, fontFamily: 'Montserrat'))
                  ]
              ),
            ),),
          Center(
            child: Container(
              padding: const EdgeInsets.only(left: 80, right: 80, bottom: 40, top: 40),
              child: const Text(LANDING_TITLE, style: TextStyle(fontSize: 55, height: 1), textAlign: TextAlign.center,),
            ),
          ),
        ],
      ),
    );
  }
}
