import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_exit_app/flutter_exit_app.dart';
import 'package:secure_flutter_apps/examples/jail_break_detection/jail_break_detection.dart';
import 'package:secure_flutter_apps/utils/app_utils.dart';

import 'device_info.dart';

class JailBrokenExample extends StatefulWidget {
  const JailBrokenExample({super.key});

  @override
  State<JailBrokenExample> createState() => _JailBrokenExampleState();
}

class _JailBrokenExampleState extends State<JailBrokenExample> {
  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //
            ElevatedButton(
                onPressed: () async {
                  if (await JailBreakDetection().isJailBrokened()) {
                    AppUtils().showMaterialBanner(context, message: "Your device is jail brokened!!");
                    Timer(const Duration(seconds: 3), () {
                      FlutterExitApp.exitApp(iosForceExit: true);
                    });
                  }
                },
                child: const Text("Is Jail Brokened?")),
                    //
            ElevatedButton(
                onPressed: () async {
                  final String _deviceInfo = await DeviceInfo().get();

                  showModalBottomSheet(
                      context: context,
                      showDragHandle: true,
                      isScrollControlled: true,
                      builder: (insideCtx) {
                        return BottomSheet(
                            onClosing: () {},
                            builder: (ctx) {
                              return SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 16),
                                      Text(
                                        _deviceInfo,
                                        style: TextStyle(color: _theme.primaryColor),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                      });
                },
                child: const Text("Show Device Info"))
          ],
        ),
      ),
    );
  }
}
