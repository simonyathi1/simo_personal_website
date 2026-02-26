import 'package:flutter_test/flutter_test.dart';
import 'package:simo_personal_website/modules/core/models/project_item.dart';

void main() {
  const base = ProjectItem(
    imageAsset: 'assets/images/icons/WORK.png',
    title: 'Work',
    projectName: 'Vitality Global',
    projectSummary: 'Working as a Snr. Mobile Engineer.',
    projectDetail: 'Detailed description here.',
  );

  group('ProjectItem', () {
    test('equality — two identical instances are equal', () {
      const other = ProjectItem(
        imageAsset: 'assets/images/icons/WORK.png',
        title: 'Work',
        projectName: 'Vitality Global',
        projectSummary: 'Something else',
        projectDetail: 'Another detail',
      );
      expect(base, equals(other));
    });

    test('inequality — different title or projectName are not equal', () {
      const other = ProjectItem(
        imageAsset: 'assets/images/icons/PDP2.png',
        title: 'PDP',
        projectName: 'Road to Architect',
        projectSummary: 'PDP summary',
        projectDetail: 'PDP detail',
      );
      expect(base, isNot(equals(other)));
    });

    test('hashCode — equal objects share the same hashCode', () {
      const other = ProjectItem(
        imageAsset: 'assets/images/icons/WORK.png',
        title: 'Work',
        projectName: 'Vitality Global',
        projectSummary: 'Different',
        projectDetail: 'Different',
      );
      expect(base.hashCode, equals(other.hashCode));
    });

    test('copyWith — returns new instance with changed fields', () {
      final copy = base.copyWith(title: 'Updated', projectName: 'New Project');
      expect(copy.title, 'Updated');
      expect(copy.projectName, 'New Project');
      expect(copy.imageAsset, base.imageAsset);
      expect(copy.projectSummary, base.projectSummary);
      expect(copy.projectDetail, base.projectDetail);
    });

    test('copyWith — unchanged fields remain the same', () {
      final copy = base.copyWith();
      expect(copy.title, base.title);
      expect(copy.projectName, base.projectName);
      expect(copy.imageAsset, base.imageAsset);
    });

    test('toString — contains title and projectName', () {
      expect(base.toString(), contains('Work'));
      expect(base.toString(), contains('Vitality Global'));
    });
  });
}
