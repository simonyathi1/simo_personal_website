import 'package:flutter_modular/flutter_modular.dart';

import 'pages/splash_page.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => const [];

  @override
  List<Bind> get binds => const [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/splash', child: (_, __) => const SplashPage()),
  ];
}