import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:simo_personal_website/modules/core/constants/light_color_constant.dart';
import 'package:simo_personal_website/modules/home/widgets/navigation/common/social_section_widget.dart';

class SiteNavigationBar extends StatelessWidget {
  const SiteNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      toolbarHeight: 180,
      title: Row(
        children: [
           const Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.only(left: 120),
              child: Row(
                children: [
                  _NavBarItem(title: "HOME"),
                  _NavBarItem(title: "ABOUT"),
                  _NavBarItem(title: "PORTFOLIO"),
                  _NavBarItem(title: "CERTS"),
                  _NavBarItem(title: "PDP"),
                ],
              ),
            ),
          ),
          Expanded(
              flex: 1,
              child: Column(
                children: [
                  SizedBox(
                      height: 60,
                      child: Image.asset('assets/images/logo/S-no-border-small.png', color: lightSecondaryColor,),
                  ),
                  const Center(
                    child:
                    Text("SIMO\nNYATHI", style: TextStyle(fontSize: 14, color: lightSecondaryColor, letterSpacing: 4, fontWeight: FontWeight.bold, fontFamily: 'Montserrat'), textAlign: TextAlign.center,),
                  )
                ],
              )),
          const Expanded(
            flex: 5,
            child: SocialSectionWidget(originalColor: lightSecondaryColor,)
          ),
        ],
      ),
    );
  }
}

class _NavBarItem extends StatefulWidget {
  final String title;
  const _NavBarItem({required this.title});

  @override
  State<_NavBarItem> createState() => _NavBarItemState();
}

class _NavBarItemState extends State<_NavBarItem> {
  Color c = lightSecondaryColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => setState(() {
              // _selectedIndex = index;
            }),
        onHover: (x) {
          setState(() {
            if (x) {
              c = lightAccentColor;
            } else {
              c = lightSecondaryColor;
            }
          });
        },
        hoverColor: Colors.transparent,
        child: SizedBox(
          height: 100,
            width: 100,
            child: Center(
              child: Text(
                        widget.title,
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, fontFamily: 'Montserrat', color: c),
                      ),
            )));
  }
}
