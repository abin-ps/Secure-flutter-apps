import 'package:flutter/material.dart';
import 'package:secure_flutter_apps/routes/routes.dart';
import 'package:secure_flutter_apps/widgets/nav_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          //pages
          //1. Securing API Keys
          NavigationTile(route: RouterConfigs.securingAPIKeysExample, label: "Securing API Keys"),
        ],
      ),
    );
  }
}
