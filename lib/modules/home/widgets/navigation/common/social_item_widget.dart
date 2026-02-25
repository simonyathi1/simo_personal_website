import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/models/social_link.dart';

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
    _color = widget.originalColor;
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
      width: 20,
      height: 20,
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
          child: Image.asset(widget.link.imageAsset, color: _color),
        ),
      ),
    );
  }
}
