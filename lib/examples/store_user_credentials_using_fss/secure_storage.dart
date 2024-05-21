import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  final String _keyUserName = "username";
  final String _keyInterests = "interests";

  Future<bool> storeUserName(String value) async {
    //if already stored something return false without storing.
    return retreiveUserName().then((v) async {
      if (v.isEmpty) {
        await _secureStorage.write(key: _keyUserName, value: value);
        return true;
      }
      return false;
    });
  }

  Future<bool> storeInterests(List<String> interests) async {
    //if already stored something return false without storing.
    return retreiveInterests().then((v) async {
      if (v.isEmpty) {
        final String value = json.encode(interests);
        await _secureStorage.write(key: _keyInterests, value: value);
        return true;
      }
      return false;
    });
  }

  Future<String> retreiveUserName() async {
    return (await _secureStorage.read(key: _keyUserName) ?? "");
  }

  Future<List<String>> retreiveInterests() async {
    final value = await _secureStorage.read(key: _keyInterests);
    return value == null ? [] : List<String>.from(json.decode(value));
  }

  Future<void> deleteAllData() async {
    await _secureStorage.deleteAll();
  }
}
