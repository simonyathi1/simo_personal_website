
import 'package:flutter/material.dart';

import '../../../../core/constants/light_color_constant.dart';

class GrayscaleHoverImage extends StatefulWidget {
  final String imageUrl;

  const GrayscaleHoverImage({super.key, required this.imageUrl});

  @override
  GrayScaleHoverImageState createState() => GrayScaleHoverImageState();
}

class GrayScaleHoverImageState extends State<GrayscaleHoverImage>  with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _scaleAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.1).chain(CurveTween(curve: Curves.easeOut)), weight: 100),
      TweenSequenceItem(tween: Tween(begin: 1.1, end: 1.0).chain(CurveTween(curve: Curves.bounceOut)), weight: 50),
    ]).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _setHover(true),
      onExit: (_) => _setHover(false),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: lightCardBackgroundColor),
          borderRadius: BorderRadius.circular(360.0),
        ),
        padding: const EdgeInsets.all(25),
        constraints: BoxConstraints.tight(const Size.fromHeight(170)),
        width: 200,
        child: Stack(
          fit: StackFit.expand,
          children: [
            ColorFiltered(
              colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
              child: Image.asset(widget.imageUrl),
            ),
            AnimatedOpacity(
              opacity: _isHovered ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 200),
              child:ScaleTransition(
                scale: _scaleAnimation,
                child: Image.asset(widget.imageUrl),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // void _setHover(bool hovered) {
  //   setState(() {
  //     _isHovered = hovered;
  //   });
  // }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _setHover(bool hovered) {
    setState(() {
      _isHovered = hovered;
      if (hovered) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }
}
