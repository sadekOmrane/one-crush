import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mobile/core/constants/string_constants.dart';
import 'package:mobile/features/auth/domain/entities/user_entity.dart';

class SecureStorage {
  static FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  static Future<void> write(String key, String value) async {
    await _secureStorage.write(key: key, value: value);
  }

  static Future<String?> read(String key) async {
    return await _secureStorage.read(key: key);
  }

  static Future<void> delete(String key) async {
    await _secureStorage.delete(key: key);
  }

  static Future<void> deleteAll() async {
    await _secureStorage.deleteAll();
  }

  static Future<UserEntity?> getUser() async {
    final user = await read(StringConstants.APP_USER_KEY);
    print(user);
    if (user != null) {
      return UserEntity.fromJson(jsonDecode(user));
    }
    return null;
  }

  static Future<void> setUser(UserEntity user) async {
    await write(StringConstants.APP_USER_KEY, jsonEncode(user.toJson()));
  }

  static Future<void> removeUser() async {
    await delete(StringConstants.APP_USER_KEY);
  }

  static Future<String?> getToken() async {
    return await read(StringConstants.APP_TOKEN_KEY);
  }

  static Future<void> setToken(String token) async {
    await write(StringConstants.APP_TOKEN_KEY, token);
  }

  static Future<void> removeToken() async {
    await delete(StringConstants.APP_TOKEN_KEY);
  }

  static Future<bool> isLoggedIn() async {
    String? token = await getToken();
    return token != null && token.isNotEmpty;
  }
}
