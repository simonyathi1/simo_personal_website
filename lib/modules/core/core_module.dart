import 'package:flutter_modular/flutter_modular.dart';
import 'services/hive_local_storage_service.dart';
import 'services/i_local_storage_service.dart';

class CoreModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<ILocalStorageService>(
          (i) => HiveLocalStorageService(),
          export: true,
        ),
      ];
}
