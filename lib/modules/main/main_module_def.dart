import 'package:flutter_modular/flutter_modular.dart';

import '../core/core_module.dart';
import '../home/home_module_def.dart';

class MainModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/', module: HomeModule()),
      ];
}
