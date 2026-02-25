import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(const NavigationState());

  void setActiveSection(PortfolioSection section) {
    emit(state.copyWith(activeSection: section));
  }

  void scrollToSection(PortfolioSection section, GlobalKey key) {
    setActiveSection(section);
    final context = key.currentContext;
    if (context == null) return;
    Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }
}
