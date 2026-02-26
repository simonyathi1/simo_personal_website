import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simo_personal_website/modules/core/models/project_item.dart';
import 'package:simo_personal_website/modules/home/widgets/pdp_and_projects/support_widgets/project_card_widget.dart';

void main() {
  const testProject = ProjectItem(
    imageAsset: 'assets/images/icons/WORK.png',
    title: 'Work',
    projectName: 'Vitality Global',
    projectSummary: 'Working as a Snr. Mobile Engineer at Discovery.',
    projectDetail: 'Detailed project description.',
  );

  Widget buildSubject() {
    return MaterialApp(
      home: Scaffold(
        body: SizedBox(
          width: 400,
          height: 600,
          child: Row(
            children: [
              Expanded(
                child: ProjectCardWidget(
                  project: testProject,
                  cardElevation: 8,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  group('ProjectCardWidget', () {
    testWidgets('renders project title label', (tester) async {
      await tester.pumpWidget(buildSubject());
      expect(find.text(testProject.title), findsOneWidget);
    });

    testWidgets('renders project name', (tester) async {
      await tester.pumpWidget(buildSubject());
      expect(find.text(testProject.projectName), findsOneWidget);
    });

    testWidgets('renders project summary', (tester) async {
      await tester.pumpWidget(buildSubject());
      expect(find.text(testProject.projectSummary), findsOneWidget);
    });

    testWidgets('tapping opens the work detail popup dialog', (tester) async {
      await tester.pumpWidget(buildSubject());
      await tester.tap(find.byType(InkWell));
      await tester.pumpAndSettle();

      // The popup dialog renders the combined title
      expect(
        find.text('${testProject.title}: ${testProject.projectName}'),
        findsOneWidget,
      );
    });

    testWidgets('popup shows Dismiss button', (tester) async {
      await tester.pumpWidget(buildSubject());
      await tester.tap(find.byType(InkWell));
      await tester.pumpAndSettle();

      expect(find.text('Dismiss'), findsOneWidget);
    });

    testWidgets('popup dismisses on Dismiss tap', (tester) async {
      await tester.pumpWidget(buildSubject());
      await tester.tap(find.byType(InkWell));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Dismiss'));
      await tester.pumpAndSettle();

      expect(
        find.text('${testProject.title}: ${testProject.projectName}'),
        findsNothing,
      );
    });
  });
}
