import 'package:flutter/foundation.dart';

@immutable
class SkillItem {
  final String imageAsset;
  final String name;

  /// Proficiency level as a percentage (0–100).
  final int level;

  const SkillItem({
    required this.imageAsset,
    required this.name,
    required this.level,
  }) : assert(level >= 0 && level <= 100, 'level must be between 0 and 100');

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SkillItem &&
          runtimeType == other.runtimeType &&
          name == other.name;

  @override
  int get hashCode => name.hashCode;

  @override
  String toString() => 'SkillItem(name: $name, level: $level)';
}
