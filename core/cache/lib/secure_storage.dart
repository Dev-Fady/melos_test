import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static late FlutterSecureStorage _storage;

  static void init() {
    _storage = const FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true),
    );
  }

  static Future<void> write({
    required String key,
    required String value,
  }) async {
    await _storage.write(key: key, value: value);
  }

  static Future<String?> read({required String key}) async {
    return await _storage.read(key: key);
  }

  static Future<void> delete({required String key}) async {
    await _storage.delete(key: key);
  }

  static Future<void> deleteAll() async {
    await _storage.deleteAll();
  }

  static Future<bool> containsKey({required String key}) async {
    final allKeys = await _storage.readAll();
    return allKeys.containsKey(key);
  }

  static Future<Set<String>> getAllKeys() async {
    final all = await _storage.readAll();
    return all.keys.toSet();
  }

  static Future<Map<String, String>> readAll() async {
    return await _storage.readAll();
  }
}
