import 'package:flutter/material.dart';
import 'package:secure_flutter_apps/examples/jail_break_detection/jail_break_detection.dart';
import 'package:secure_flutter_apps/examples/securing_api_keys/load_api_keys.dart';
import 'package:secure_flutter_apps/routes/routes.dart';

Future<void> main() async {
  //load api keys
  APIKeys().loadFromEnv();
  // await JailBreakDetection().checkForJailBroken(); //this will exit the app if it is jail brokened device
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
        textTheme: const TextTheme(
          titleMedium: TextStyle(fontSize: 20, color: Colors.white),
          bodyMedium: TextStyle(fontSize: 18, color: Colors.white),
        ),
        useMaterial3: true,
      ),
      initialRoute: RouterConfigs.homePage,
      routes: RouterConfigs().routes,
    );
  }
}
