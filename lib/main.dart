import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/core/services/local_storage_service.dart';
import 'modules/main/main_widget.dart';
import 'modules/main/main_module_def.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorageService.initialize();
  runApp(ModularApp(module: MainModule(), child: MainWidget()));
}
