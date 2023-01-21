import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserSecureStorage {
  static final _storage = FlutterSecureStorage();
  static const _keyUserName = 'username';
  static const _keyUserEmail = 'useremail';
  static const _keyUserPassword = 'userpassword';

  static Future setUserName(String userName) async {
    return await _storage.write(key: _keyUserName, value: userName);
  }

  static Future<String?> getUserName() async =>
      await _storage.read(key: _keyUserName);

// Email
  static Future setUserEmail(String userEmail) async {
    return await _storage.write(key: _keyUserEmail, value: userEmail);
  }

  static Future<String?> getUserEmail() async =>
      await _storage.read(key: _keyUserEmail);

// password
  static Future setUserPassword(String userPassword) async {
    return await _storage.write(key: _keyUserPassword, value: userPassword);
  }

  static Future<String?> getUserPassword() async =>
      await _storage.read(key: _keyUserPassword);
}
