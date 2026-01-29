import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:heros/core/services/secure_storage.dart';
import 'token_provider.dart';

class SecureTokenProvider implements TokenProvider {
  final FlutterSecureStorage storage;

  SecureTokenProvider(this.storage);

  @override
  Future<String?> getToken() async {
    return storage.read(key: SecureStorage.token);
  }
}
