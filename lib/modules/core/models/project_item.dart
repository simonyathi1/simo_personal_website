import 'package:flutter/foundation.dart';

@immutable
class ProjectItem {
  final String imageAsset;
  final String title;
  final String projectName;
  final String projectSummary;
  final String projectDetail;

  const ProjectItem({
    required this.imageAsset,
    required this.title,
    required this.projectName,
    required this.projectSummary,
    required this.projectDetail,
  });

  ProjectItem copyWith({
    String? imageAsset,
    String? title,
    String? projectName,
    String? projectSummary,
    String? projectDetail,
  }) {
    return ProjectItem(
      imageAsset: imageAsset ?? this.imageAsset,
      title: title ?? this.title,
      projectName: projectName ?? this.projectName,
      projectSummary: projectSummary ?? this.projectSummary,
      projectDetail: projectDetail ?? this.projectDetail,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProjectItem &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          projectName == other.projectName;

  @override
  int get hashCode => Object.hash(title, projectName);

  @override
  String toString() =>
      'ProjectItem(title: $title, projectName: $projectName)';
}
