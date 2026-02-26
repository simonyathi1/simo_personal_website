import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../core/theme/app_theme.dart';

class MainWidget extends StatelessWidget {
  MainWidget({super.key}) {
    Modular.setInitialRoute('/splash');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Simo Nyathi',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
