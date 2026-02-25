import 'package:flutter/material.dart';
import '../../../../../core/util/responsive.dart';

class CompanyGrayscaleHoverImage extends StatefulWidget {
  final String imageUrl;

  const CompanyGrayscaleHoverImage({super.key, required this.imageUrl});

  @override
  CompanyGrayscaleHoverImageState createState() =>
      CompanyGrayscaleHoverImageState();
}

class CompanyGrayscaleHoverImageState extends State<CompanyGrayscaleHoverImage>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _scaleAnimation = TweenSequence([
      TweenSequenceItem(
        tween: Tween(begin: 1.0, end: 1.1)
            .chain(CurveTween(curve: Curves.easeOut)),
        weight: 100,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 1.1, end: 1.0)
            .chain(CurveTween(curve: Curves.bounceOut)),
        weight: 50,
      ),
    ]).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _setHover(bool hovered) {
    setState(() {
      _isHovered = hovered;
      if (hovered) {
        _controller.forward(from: 0);
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isTouch = !Responsive.isDesktop(context);

    return MouseRegion(
      onEnter: (_) => _setHover(true),
      onExit: (_) => _setHover(false),
      child: Container(
        constraints: BoxConstraints.tight(const Size.fromHeight(54)),
        width: 150,
        child: isTouch
            // Touch screens: full colour, no greyscale.
            ? Image.asset(widget.imageUrl)
            // Desktop: greyscale at rest, colour on hover.
            : Stack(
                fit: StackFit.expand,
                children: [
                  ColorFiltered(
                    colorFilter: const ColorFilter.mode(
                      Colors.grey,
                      BlendMode.srcIn,
                    ),
                    child: Image.asset(widget.imageUrl),
                  ),
                  AnimatedOpacity(
                    opacity: _isHovered ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 200),
                    child: ScaleTransition(
                      scale: _scaleAnimation,
                      child: Image.asset(widget.imageUrl),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
