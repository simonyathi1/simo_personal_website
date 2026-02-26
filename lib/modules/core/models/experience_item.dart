import 'package:flutter/foundation.dart';

@immutable
class ExperienceItem {
  final String role;
  final String organisation;

  const ExperienceItem({
    required this.role,
    required this.organisation,
  });

  ExperienceItem copyWith({String? role, String? organisation}) {
    return ExperienceItem(
      role: role ?? this.role,
      organisation: organisation ?? this.organisation,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExperienceItem &&
          runtimeType == other.runtimeType &&
          role == other.role &&
          organisation == other.organisation;

  @override
  int get hashCode => Object.hash(role, organisation);

  @override
  String toString() => 'ExperienceItem(role: $role, organisation: $organisation)';
}
