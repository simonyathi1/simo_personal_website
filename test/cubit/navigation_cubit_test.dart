import 'package:flutter_test/flutter_test.dart';
import 'package:simo_personal_website/modules/home/cubit/navigation_cubit.dart';
import 'package:simo_personal_website/modules/home/cubit/navigation_state.dart';

void main() {
  group('NavigationCubit', () {
    late NavigationCubit cubit;

    setUp(() {
      cubit = NavigationCubit();
    });

    tearDown(() => cubit.close());

    test('initial state is home section', () {
      expect(cubit.state.activeSection, PortfolioSection.home);
    });

    test('setActiveSection emits updated section', () {
      cubit.setActiveSection(PortfolioSection.about);
      expect(cubit.state.activeSection, PortfolioSection.about);
    });

    test('setActiveSection cycles through all sections', () {
      for (final section in PortfolioSection.values) {
        cubit.setActiveSection(section);
        expect(cubit.state.activeSection, section);
      }
    });

    test('NavigationState equality holds for same section', () {
      const s1 = NavigationState(activeSection: PortfolioSection.skills);
      const s2 = NavigationState(activeSection: PortfolioSection.skills);
      expect(s1, equals(s2));
    });

    test('NavigationState inequality for different sections', () {
      const s1 = NavigationState(activeSection: PortfolioSection.contact);
      const s2 = NavigationState(activeSection: PortfolioSection.projects);
      expect(s1, isNot(equals(s2)));
    });

    test('copyWith returns new state with updated section', () {
      const original = NavigationState(activeSection: PortfolioSection.home);
      final updated = original.copyWith(activeSection: PortfolioSection.experience);
      expect(updated.activeSection, PortfolioSection.experience);
      expect(original.activeSection, PortfolioSection.home);
    });

    test('emits states in order when sections are changed sequentially', () async {
      final emitted = <PortfolioSection>[];
      final subscription = cubit.stream.listen((s) => emitted.add(s.activeSection));

      cubit.setActiveSection(PortfolioSection.about);
      cubit.setActiveSection(PortfolioSection.skills);
      cubit.setActiveSection(PortfolioSection.contact);

      await subscription.cancel();

      expect(emitted, [
        PortfolioSection.about,
        PortfolioSection.skills,
        PortfolioSection.contact,
      ]);
    });
  });
}
