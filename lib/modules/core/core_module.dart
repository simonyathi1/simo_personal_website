import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'services/local_storage_service.dart';


class CoreModule extends Module {
  @override
  List<Bind> get binds => [
    Bind<LocalStorageService>((i) => LocalStorageService(), export: true),
    Bind<Dio>((i) => Dio(), export: true),
  ];
}