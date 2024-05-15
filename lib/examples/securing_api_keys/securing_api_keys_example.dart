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
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.primaryColor.withOpacity(.7),
      appBar: _buildAppBarSection(theme),
      body: _displayAPIKeysFromEnvWidget(theme),
    );
  }

  AppBar _buildAppBarSection(final ThemeData theme) {
    return AppBar(
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_rounded, color: Colors.white)),
      title: Text("Securing API Keys Example", style: theme.textTheme.titleMedium),
      centerTitle: true,
      backgroundColor: Colors.transparent,
    );
  }

  Widget _displayAPIKeysFromEnvWidget(final ThemeData theme) {
    final Color primaryColor = theme.primaryColor;
    final TextStyle textStyle = theme.textTheme.bodyMedium!;
    return Center(
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
    );
  }
}
