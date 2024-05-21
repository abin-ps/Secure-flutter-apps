import 'dart:io';

import 'package:flutter_exit_app/flutter_exit_app.dart';
import 'package:flutter_jailbreak_detection/flutter_jailbreak_detection.dart';

class JailBreakDetection {
  //jail broken detection
  Future<void> checkForJailBroken() async {
    bool jailBroken = await FlutterJailbreakDetection.jailbroken;
    if (jailBroken) {
      FlutterExitApp.exitApp(iosForceExit: true);
    }
  }

  Future<bool> isJailBrokened() async {
    bool jailBroken = await FlutterJailbreakDetection.jailbroken;
    return jailBroken;
  }
}
