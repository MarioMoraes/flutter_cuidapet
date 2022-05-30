import 'package:flutter_cuidapet/app/core/local_storage/local_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class FlutterSecureLocalStorageImpl extends LocalSecureStorage {
  FlutterSecureStorage get _instance => const FlutterSecureStorage();

  @override
  Future<void> clear() => _instance.deleteAll();

  @override
  Future<bool> contains(String key) => _instance.containsKey(key: key);

  @override
  Future<String?> read<V>(String key) => _instance.read(key: key);

  @override
  Future<void> remove(String key) => _instance.delete(key: key);

  @override
  Future<void> write<V>(String key, String value) =>
      _instance.write(key: key, value: value);
}
