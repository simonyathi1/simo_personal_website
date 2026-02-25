import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simo_personal_website/modules/home/widgets/contact/contact_widget.dart';

void main() {
  Widget buildSubject() {
    return const MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: ContactDetailsWidget(),
        ),
      ),
    );
  }

  group('ContactDetailsWidget — flip animation', () {
    testWidgets('section title is always visible', (tester) async {
      await tester.pumpWidget(buildSubject());
      expect(find.text('Contact Me'), findsOneWidget);
    });

    testWidgets('business card image is shown before flip', (tester) async {
      await tester.pumpWidget(buildSubject());

      // The front face contains a Card wrapping the business card asset.
      // Before flip the form fields are not visible.
      expect(find.byType(TextFormField), findsNothing);
    });

    testWidgets('form fields appear after tapping the business card', (tester) async {
      await tester.pumpWidget(buildSubject());

      // Tap the GestureDetector that wraps the business card front face.
      await tester.tap(find.byType(GestureDetector).first);

      // Allow the 600 ms flip animation to complete.
      await tester.pump(const Duration(milliseconds: 700));

      expect(find.byType(TextFormField), findsWidgets);
    });

    testWidgets('form has Name, Email, and Message fields after flip', (tester) async {
      await tester.pumpWidget(buildSubject());

      await tester.tap(find.byType(GestureDetector).first);
      await tester.pump(const Duration(milliseconds: 700));

      expect(find.widgetWithText(TextFormField, 'Name'),    findsOneWidget);
      expect(find.widgetWithText(TextFormField, 'Email'),   findsOneWidget);
      expect(find.widgetWithText(TextFormField, 'Message'), findsOneWidget);
    });

    testWidgets('SEND MESSAGE button is visible after flip', (tester) async {
      await tester.pumpWidget(buildSubject());

      await tester.tap(find.byType(GestureDetector).first);
      await tester.pump(const Duration(milliseconds: 700));

      expect(find.text('SEND MESSAGE'), findsOneWidget);
    });

    testWidgets('submitting empty form shows validation errors', (tester) async {
      await tester.pumpWidget(buildSubject());

      await tester.tap(find.byType(GestureDetector).first);
      await tester.pump(const Duration(milliseconds: 700));

      await tester.tap(find.text('SEND MESSAGE'));
      await tester.pump();

      expect(find.text('Name is required'),    findsOneWidget);
      expect(find.text('Email is required'),   findsOneWidget);
      expect(find.text('Message is required'), findsOneWidget);
    });
  });
}
