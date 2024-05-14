import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:secure_flutter_apps/examples/securing_api_keys/load_api_keys.dart';

class SecuringAPIKeysExample extends StatefulWidget {
  const SecuringAPIKeysExample({super.key});

  @override
  State<SecuringAPIKeysExample> createState() => _SecuringAPIKeysExampleState();
}

class _SecuringAPIKeysExampleState extends State<SecuringAPIKeysExample> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final Color primaryColor = theme.primaryColor;
    final TextStyle textStyle = theme.textTheme.bodyMedium!;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Securing API Keys Example"),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          color: primaryColor,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Google Map API key: ${APIKeys().googleMapAPIKey ?? ''}",
                  style: textStyle,
                ),
                Text(
                  "My Secret Key: ${APIKeys().secretKey ?? ''}",
                  style: textStyle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
