import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mobile/core/constants/string_constants.dart';
import 'package:mobile/features/auth/domain/entities/user_entity.dart';

class SecureStorage {
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  Future<void> write(String key, String value) async {
    await _secureStorage.write(key: key, value: value);
  }

  Future<String?> read(String key) async {
    return await _secureStorage.read(key: key);
  }

  Future<void> delete(String key) async {
    await _secureStorage.delete(key: key);
  }

  Future<void> deleteAll() async {
    await _secureStorage.deleteAll();
  }

  Future<UserEntity?> getUser() async {
    final user = await read(StringConstants.APP_USER_KEY);
    print(user);
    if (user != null) {
      return UserEntity.fromJson(jsonDecode(user));
    }
    return null;
  }

  Future<void> setUser(UserEntity user) async {
    await write(StringConstants.APP_USER_KEY, jsonEncode(user.toJson()));
  }

  Future<void> removeUser() async {
    await delete(StringConstants.APP_USER_KEY);
  }

  Future<String?> getToken() async {
    return await read(StringConstants.APP_TOKEN_KEY);
  }

  Future<void> setToken(String token) async {
    await write(StringConstants.APP_TOKEN_KEY, token);
  }

  Future<void> removeToken() async {
    await delete(StringConstants.APP_TOKEN_KEY);
  }

  Future<bool> isUserLoggedIn() async {
    final user = await getUser();
    final token = await getToken();
    return user != null && token != null;
  }
}
