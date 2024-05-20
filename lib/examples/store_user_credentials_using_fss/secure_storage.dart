import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  final String _keyUserName = "username";
  final String _keyInterests = "interests";

  Future<void> storeUserName(String value) async {
    await _secureStorage.write(key: _keyUserName, value: value);
  }

  Future<void> storeInterests(List<String> interests) async {
    final String value = json.encode(interests);
    await _secureStorage.write(key: _keyInterests, value: value);
  }

  Future<String> retreiveUserName() async {
    return (await _secureStorage.read(key: _keyUserName) ?? "No Data Found");
  }

  Future<List<String>> retreiveInterests() async {
    final value = await _secureStorage.read(key: _keyInterests);
    return value==null? []: List<String>.from(json.decode(value));
  }

  Future<void> deleteAllData() async{
    await _secureStorage.deleteAll();
  }
}
