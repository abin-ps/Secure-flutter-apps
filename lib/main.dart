import 'package:flutter/material.dart';
import 'package:secure_flutter_apps/examples/securing_api_keys/load_api_keys.dart';
import 'package:secure_flutter_apps/routes/routes.dart';

Future<void> main() async {
  //load api keys
  APIKeys().loadFromEnv();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme: const TextTheme(bodyMedium: TextStyle(fontSize: 18, color: Colors.white)),
        useMaterial3: true,
      ),
      initialRoute: RouterConfigs.homePage,
      routes: RouterConfigs().routes,
    );
  }
}
