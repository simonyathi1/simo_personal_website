import 'package:flutter_modular/flutter_modular.dart';
import 'pages/home_page.dart';
import 'pages/splash_page.dart';

class HomeModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute('/splash', child: (_, __) => const SplashPage()),
        ChildRoute('/home', child: (_, __) => const HomePage()),
      ];
}
