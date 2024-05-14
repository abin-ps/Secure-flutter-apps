import 'package:flutter_dotenv/flutter_dotenv.dart';

class APIKeys {
  Future<void> loadFromEnv() async {
    await dotenv.load(fileName: ".env");
  }

  String? get googleMapAPIKey => dotenv.env["GOOGLE_MAP_API_KEY"];
  String? get secretKey => dotenv.env["MY_SECRET_KEY"];
}
