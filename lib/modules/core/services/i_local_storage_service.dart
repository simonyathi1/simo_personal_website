abstract class ILocalStorageService {
  Future<String?> get(String key);
  Future<void> save(String key, String value);
}
