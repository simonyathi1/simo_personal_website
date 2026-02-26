import 'package:flutter/foundation.dart';

enum PortfolioSection { home, about, skills, experience, competencies, pdp, contact }

@immutable
class NavigationState {
  final PortfolioSection activeSection;

  const NavigationState({this.activeSection = PortfolioSection.home});

  NavigationState copyWith({PortfolioSection? activeSection}) {
    return NavigationState(activeSection: activeSection ?? this.activeSection);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NavigationState &&
          runtimeType == other.runtimeType &&
          activeSection == other.activeSection;

  @override
  int get hashCode => activeSection.hashCode;
}
