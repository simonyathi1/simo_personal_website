import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/util/responsive.dart';

/// Displays an image in greyscale at rest and in full colour on hover.
///
/// On mobile and tablet the greyscale filter is skipped entirely — touch
/// screens cannot hover, so showing a permanently grey image would be
/// confusing and unattractive.
class GrayscaleHoverImage extends StatefulWidget {
  final String imageUrl;
  final double width;
  final double height;

  const GrayscaleHoverImage({
    super.key,
    required this.imageUrl,
    this.width = 200,
    this.height = 170,
  });

  @override
  GrayScaleHoverImageState createState() => GrayScaleHoverImageState();
}

class GrayScaleHoverImageState extends State<GrayscaleHoverImage>
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
        decoration: widget.width > 50 ? BoxDecoration(
          border: Border.all(color: AppColors.lightCardBackground),
          borderRadius: BorderRadius.circular(360.0),
        ): null,
        padding: widget.width > 50 ? const EdgeInsets.all(25) : const EdgeInsets.all(0),
        constraints: BoxConstraints.tight(Size(widget.width, widget.height)),
        child: isTouch
            // Touch screen: always show full colour, no greyscale.
            ? Image.asset(widget.imageUrl)
            // Desktop: greyscale at rest, colour on hover.
            : Stack(
                fit: StackFit.expand,
                children: [
                  ColorFiltered(
                    colorFilter: const ColorFilter.mode(
                      AppColors.lightPrimary,
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
