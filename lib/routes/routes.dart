import 'package:flutter/material.dart';
import 'package:secure_flutter_apps/examples/jail_break_detection/jail_broken_example.dart';
import 'package:secure_flutter_apps/examples/store_user_credentials_using_fss/store_user_credentials_example.dart';
import 'package:secure_flutter_apps/pages/home_page.dart';

import '../examples/securing_api_keys/securing_api_keys_example.dart';

class RouterConfigs {
  static const String homePage = "/";
  static const String securingAPIKeysExample = "/SecuringAPIKeysExample";
  static const String storeUserCredsExample = "/StoreUserCredsExample";
  static const String jailBrokenDetectionExample = "/JailBrokenDetectionExample";

  final Map<String, WidgetBuilder> _routes = {
    homePage: (context) => const HomePage(),
    securingAPIKeysExample: (context) => const SecuringAPIKeysExample(),
    storeUserCredsExample: (context) => const StoreUserCredentialsExample(),
    jailBrokenDetectionExample: (context) => const JailBrokenExample(),
  };

  //routes getter
  Map<String, WidgetBuilder> get routes => _routes;
}
