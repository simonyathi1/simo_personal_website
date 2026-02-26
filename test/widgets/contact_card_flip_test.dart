import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simo_personal_website/modules/home/widgets/contact/contact_widget.dart';

Widget buildSubject({Size size = const Size(1200, 900)}) {
  return MaterialApp(
    home: MediaQuery(
      data: MediaQueryData(size: size),
      child: const Scaffold(
        body: SingleChildScrollView(
          child: ContactDetailsWidget(),
        ),
      ),
    ),
  );
}

void main() {
  group('ContactDetailsWidget — flip animation (desktop)', () {
    testWidgets('section title is always visible', (tester) async {
      await tester.pumpWidget(buildSubject());
      expect(find.text('Contact Me'), findsOneWidget);
    });

    testWidgets('form fields are hidden before flip', (tester) async {
      await tester.pumpWidget(buildSubject());
      expect(find.byType(TextFormField), findsNothing);
    });

    testWidgets('form fields appear after tapping the business card', (tester) async {
      await tester.pumpWidget(buildSubject());

      await tester.tap(find.byType(GestureDetector).first);
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

  group('ContactDetailsWidget — flip animation (mobile)', () {
    const mobileSize = Size(390, 844);

    testWidgets('section title is visible on mobile', (tester) async {
      await tester.pumpWidget(buildSubject(size: mobileSize));
      expect(find.text('Contact Me'), findsOneWidget);
    });

    testWidgets('form fields hidden before flip on mobile', (tester) async {
      await tester.pumpWidget(buildSubject(size: mobileSize));
      expect(find.byType(TextFormField), findsNothing);
    });
  });
}
