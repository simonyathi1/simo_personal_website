import 'package:flutter/material.dart';

class GradientImageContainer extends StatelessWidget {
  final String imageUrl;

  const GradientImageContainer({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 200,
      child: ShaderMask(
        shaderCallback: (Rect bounds) {
          return const RadialGradient(
            center: Alignment.center,
            radius: 1.0,
            colors: [Colors.transparent, Colors.white],
            stops: [0.7, 1.0],
          ).createShader(bounds);
        },
        blendMode: BlendMode.dstIn,
        child: Image.asset(
          imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}