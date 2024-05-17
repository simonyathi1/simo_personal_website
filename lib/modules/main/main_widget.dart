import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:simo_personal_website/modules/core/constants/light_color_constant.dart';

class MainWidget extends StatelessWidget {
  MainWidget({super.key}) {
    Modular.setInitialRoute('/splash');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Simo Nyathi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: lightBackgroundColor,
        fontFamily: "Crimson_Text",
        brightness: Brightness.light
      ),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}