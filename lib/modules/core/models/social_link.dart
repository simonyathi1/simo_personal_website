import 'package:flutter/foundation.dart';

@immutable
class SocialLink {
  final String imageAsset;
  final String url;
  final String label;

  const SocialLink({
    required this.imageAsset,
    required this.url,
    required this.label,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SocialLink &&
          runtimeType == other.runtimeType &&
          url == other.url;

  @override
  int get hashCode => url.hashCode;

  @override
  String toString() => 'SocialLink(label: $label, url: $url)';
}
