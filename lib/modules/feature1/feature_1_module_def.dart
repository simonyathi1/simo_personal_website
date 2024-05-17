import 'package:flutter_modular/flutter_modular.dart';

import 'pages/feature_1_base_page.dart';
import 'pages/feature_1_details_page.dart';
import 'repositories/feature_1_repo.dart';

class Feature1Module extends Module {
  @override
  List<Module> get imports => const [];

  @override
  List<Bind> get binds => [
    Bind((i)=> Feature1Repository(i())),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (_, __) => const Feature1BasePage(), transition: TransitionType.fadeIn),
    ChildRoute('/detail', child: (_, args) => Feature1DetailPage(berry: args.data), transition: TransitionType.downToUp),
  ];
}