import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simo_personal_website/modules/core/util/responsive.dart';

Widget buildSubject({required Size size}) {
  return MaterialApp(
    home: MediaQuery(
      data: MediaQueryData(size: size),
      child: const Scaffold(
        body: ResponsiveLayout(
          mobile: _Label.mobile,
          tablet: _Label.tablet,
          desktop: _Label.desktop,
        ),
      ),
    ),
  );
}

// Simple static builder functions usable as const tear-offs.
abstract class _Label {
  static Widget mobile(BuildContext _)  => const Text('mobile');
  static Widget tablet(BuildContext _)  => const Text('tablet');
  static Widget desktop(BuildContext _) => const Text('desktop');
}

void main() {
  group('Responsive.value', () {
    testWidgets('returns mobile value when width < 850', (tester) async {
      await tester.pumpWidget(buildSubject(size: const Size(400, 800)));
      expect(find.text('mobile'), findsOneWidget);
      expect(find.text('tablet'), findsNothing);
      expect(find.text('desktop'), findsNothing);
    });

    testWidgets('returns tablet value when 850 ≤ width < 1100', (tester) async {
      await tester.pumpWidget(buildSubject(size: const Size(1000, 800)));
      expect(find.text('tablet'), findsOneWidget);
      expect(find.text('mobile'), findsNothing);
      expect(find.text('desktop'), findsNothing);
    });

    testWidgets('returns desktop value when width ≥ 1100', (tester) async {
      await tester.pumpWidget(buildSubject(size: const Size(1440, 900)));
      expect(find.text('desktop'), findsOneWidget);
      expect(find.text('mobile'), findsNothing);
      expect(find.text('tablet'), findsNothing);
    });
  });

  group('ResponsiveLayout — tablet fallback to desktop', () {
    testWidgets('falls back to desktop builder when tablet is omitted', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: MediaQuery(
            data: const MediaQueryData(size: Size(1000, 800)),
            child: const Scaffold(
              body: ResponsiveLayout(
                // tablet not provided
                mobile: _Label.mobile,
                desktop: _Label.desktop,
              ),
            ),
          ),
        ),
      );
      expect(find.text('desktop'), findsOneWidget);
      expect(find.text('mobile'), findsNothing);
    });
  });

  group('Responsive boolean helpers', () {
    testWidgets('isMobile is true below 850', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: MediaQuery(
            data: const MediaQueryData(size: Size(849, 800)),
            child: Builder(
              builder: (ctx) {
                expect(Responsive.isMobile(ctx), isTrue);
                expect(Responsive.isTablet(ctx), isFalse);
                expect(Responsive.isDesktop(ctx), isFalse);
                return const SizedBox.shrink();
              },
            ),
          ),
        ),
      );
    });

    testWidgets('isTablet is true at exactly 850', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: MediaQuery(
            data: const MediaQueryData(size: Size(850, 800)),
            child: Builder(
              builder: (ctx) {
                expect(Responsive.isMobile(ctx), isFalse);
                expect(Responsive.isTablet(ctx), isTrue);
                expect(Responsive.isDesktop(ctx), isFalse);
                return const SizedBox.shrink();
              },
            ),
          ),
        ),
      );
    });

    testWidgets('isDesktop is true at exactly 1100', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: MediaQuery(
            data: const MediaQueryData(size: Size(1100, 900)),
            child: Builder(
              builder: (ctx) {
                expect(Responsive.isMobile(ctx), isFalse);
                expect(Responsive.isTablet(ctx), isFalse);
                expect(Responsive.isDesktop(ctx), isTrue);
                return const SizedBox.shrink();
              },
            ),
          ),
        ),
      );
    });
  });
}
