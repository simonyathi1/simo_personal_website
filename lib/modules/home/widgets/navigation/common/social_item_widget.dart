
import 'package:flutter/material.dart';

class SocialItemWidget extends StatefulWidget {
  final String imageUrl;
  final Color originalColor;
  const SocialItemWidget({super.key, required this.imageUrl, required this.originalColor});

  @override
  State<SocialItemWidget> createState() => _SocialItemWidgetState(colorOverlay: originalColor);
}

class _SocialItemWidgetState extends State<SocialItemWidget> {
  late Color colorOverlay;

  _SocialItemWidgetState({required this.colorOverlay});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 20,
      height: 20,
      child: InkWell(
          onTap: () => setState(() {
            // _selectedIndex = index;
          }),
          onHover: (x) {
            setState(() {
              if (x) {
                colorOverlay = Colors.transparent;
              } else {
                colorOverlay = widget.originalColor;
              }
            });
          },
          hoverColor: Colors.transparent,
          child: Image.asset(widget.imageUrl, color: colorOverlay,)),
    );
  }
}
