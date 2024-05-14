import 'package:flutter/material.dart';
import 'package:secure_flutter_apps/pages/home_page.dart';

import '../examples/securing_api_keys/securing_api_keys_example.dart';

class RouterConfigs {
  static const String homePage = "/";
  static const String securingAPIKeysExample = "/SecuringAPIKeysExample";

  final Map<String, WidgetBuilder> _routes = {
    homePage: (context) => const HomePage(),
    securingAPIKeysExample: (context) => const SecuringAPIKeysExample(),
  };

  //routes getter
  Map<String, WidgetBuilder> get routes => _routes;
}
