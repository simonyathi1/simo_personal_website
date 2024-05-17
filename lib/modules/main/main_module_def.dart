
import 'package:flutter_modular/flutter_modular.dart';

import '../core/core_module.dart';
import '../feature1/feature_1_module_def.dart';
import '../home/home_module_def.dart';
import '../home/pages/home_page.dart';

class MainModule extends Module {
  @override
  List<Module> get imports => [
    CoreModule()
  ];

  @override
  List<ModularRoute> get routes => [
    ModuleRoute('/', module: HomeModule()),
    ChildRoute('/home', child: (_, __) => const HomePage(), children: [
      ModuleRoute('/feature1', module: Feature1Module()),
      // ModuleRoute('/feature2', module: Feature2Module()),
    ]),
  ];
}