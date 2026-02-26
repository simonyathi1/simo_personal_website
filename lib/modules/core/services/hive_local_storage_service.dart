import 'package:hive_flutter/hive_flutter.dart';
import 'i_local_storage_service.dart';

class HiveLocalStorageService implements ILocalStorageService {
  static const String _boxName = 'portfolio_prefs';

  static Future<void> initialize() async {
    Hive.initFlutter();
  }

  @override
  Future<String?> get(String key) async {
    final box = await Hive.openBox(_boxName);
    return box.get(key) as String?;
  }

  @override
  Future<void> save(String key, String value) async {
    final box = await Hive.openBox(_boxName);
    await box.put(key, value);
  }
}
