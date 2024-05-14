import 'package:flutter/material.dart';
import 'package:secure_flutter_apps/pages/home_page.dart';

class RouterConfigs {
  static const String homePage = "/";

  final Map<String, WidgetBuilder> _routes = {
    homePage: (context) => const HomePage(),
  };

  //routes getter
  Map<String, WidgetBuilder> get routes => _routes;
}
