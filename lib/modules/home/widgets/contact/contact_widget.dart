import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactDetailsWidget extends StatelessWidget {
  const ContactDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 20.0, top: 20.0),
          child: Divider(height: 1, thickness: 0.5, color: Colors.black),
        ),
        const Text(
          "Contact Me",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 40),
        ),
        SizedBox(
          height: 600,
          child: Stack(
            children: [
              Center(
                child: Image.asset(
                  'assets/images/logo/pattern1.png',
                  color: CupertinoColors.inactiveGray,
                ),
              ),
              Center(
                child: Container(
                    margin: const EdgeInsets.all(80),
                    child: Card(
                      elevation: 4,
                      child: Image.asset(
                        'assets/images/contact-card.png',
                      ),
                    )),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
