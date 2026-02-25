import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simo_personal_website/modules/core/models/experience_item.dart';
import 'package:simo_personal_website/modules/home/widgets/education_and_exp/support_widgets/experience_card_item_widget.dart';
import 'package:simo_personal_website/modules/home/widgets/education_and_exp/support_widgets/experience_card_widget.dart';

void main() {
  const testExperiences = [
    ExperienceItem(role: 'Senior Developer', organisation: 'Tech Corp'),
    ExperienceItem(role: 'Lead Engineer',    organisation: 'StartupCo'),
  ];

  Widget buildSubject({
    String title = 'Test Period',
    List<ExperienceItem> experiences = testExperiences,
  }) {
    return MaterialApp(
      home: Scaffold(
        body: SizedBox(
          height: 600,
          child: Row(
            children: [
              Expanded(
                child: ExperienceCardWidget(
                  title: title,
                  experiences: experiences,
                  cardElevation: 4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  group('ExperienceCardWidget', () {
    testWidgets('renders the uppercased title', (tester) async {
      await tester.pumpWidget(buildSubject(title: 'test period'));

      expect(find.text('TEST PERIOD'), findsOneWidget);
    });

    testWidgets('renders an ExperienceCardItem for each experience', (tester) async {
      await tester.pumpWidget(buildSubject());

      expect(
        find.byType(ExperienceCardItem),
        findsNWidgets(testExperiences.length),
      );
    });

    testWidgets('renders role and organisation for each item', (tester) async {
      await tester.pumpWidget(buildSubject());

      expect(find.text('Senior Developer'), findsOneWidget);
      expect(find.text('Tech Corp'),        findsOneWidget);
      expect(find.text('Lead Engineer'),    findsOneWidget);
      expect(find.text('StartupCo'),        findsOneWidget);
    });

    testWidgets('renders empty list without error', (tester) async {
      await tester.pumpWidget(buildSubject(experiences: []));

      expect(find.byType(ExperienceCardItem), findsNothing);
    });
  });
}
