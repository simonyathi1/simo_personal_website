import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/models/social_link.dart';
import '../../common/greyscale_hover_image_modifier.dart';

class SocialItemWidget extends StatefulWidget {
  final SocialLink link;
  final Color originalColor;

  const SocialItemWidget({
    super.key,
    required this.link,
    required this.originalColor,
  });

  @override
  State<SocialItemWidget> createState() => _SocialItemWidgetState();
}

class _SocialItemWidgetState extends State<SocialItemWidget> {
  late Color _color;

  @override
  void initState() {
    super.initState();
    _color = widget.originalColor.withValues(alpha: 0.1);
  }

  Future<void> _openUrl() async {
    final uri = Uri.parse(widget.link.url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 23,
      height: 23,
      child: InkWell(
        onTap: _openUrl,
        onHover: (isHovered) {
          setState(() {
            _color = isHovered ? Colors.transparent : widget.originalColor;
          });
        },
        hoverColor: Colors.transparent,
        child: Semantics(
          label: widget.link.label,
          button: true,
          child: GrayscaleHoverImage(
            imageUrl: widget.link.imageAsset,
            width: 20,
            height: 20,
          ),
        ),
      ),
    );
  }
}
