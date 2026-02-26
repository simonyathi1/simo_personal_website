import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simo_personal_website/modules/core/content/portfolio_content.dart';
import 'package:simo_personal_website/modules/home/widgets/skills/skills_widget.dart';
import 'package:simo_personal_website/modules/home/widgets/skills/support_widgets/skill_item_widget.dart';

void main() {
  group('SkillsWidget', () {
    Widget buildSubject() {
      return const MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(
            child: SkillsWidget(),
          ),
        ),
      );
    }

    testWidgets('renders a SkillItemWidget for every skill in PortfolioContent', (tester) async {
      await tester.pumpWidget(buildSubject());

      expect(
        find.byType(SkillItemWidget),
        findsNWidgets(PortfolioContent.skills.length),
      );
    });

    testWidgets('renders section title', (tester) async {
      await tester.pumpWidget(buildSubject());

      expect(find.text('My Skills and Abilities'), findsOneWidget);
    });

    testWidgets('renders skill names from PortfolioContent', (tester) async {
      await tester.pumpWidget(buildSubject());

      for (final skill in PortfolioContent.skills) {
        expect(find.text(skill.name), findsOneWidget);
      }
    });
  });
}
