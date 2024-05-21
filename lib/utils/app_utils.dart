import 'dart:async';

import 'package:flutter/material.dart';

class AppUtils{
   void showMaterialBanner(context, {required String message, MaterialColor? bgColor}) {
    // //clear all material banners
    // ScaffoldMessenger.of(context).clearMaterialBanners();
    //custom material banner
    final MaterialBanner materialBanner = MaterialBanner(
      backgroundColor: bgColor?.shade300 ?? Colors.red.shade300,
      content: Text(message),
      actions: const [Icon(Icons.done)],
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      elevation: 4,
      shadowColor: bgColor?.shade100 ?? Colors.redAccent.shade100,
      overflowAlignment: OverflowBarAlignment.center,
    );
    //show material banner
    ScaffoldMessenger.of(context).showMaterialBanner(materialBanner);
    //clear the banner after 3 seconds
    Timer(const Duration(seconds: 3), () {
      ScaffoldMessenger.of(context).clearMaterialBanners();
    });
  }
   void customMaterialBanner(context, {required Widget content, MaterialColor? bgColor}) {
    // //clear all material banners
    // ScaffoldMessenger.of(context).clearMaterialBanners();
    //custom material banner
    final MaterialBanner materialBanner = MaterialBanner(
      backgroundColor: bgColor?.shade300 ?? Colors.red.shade300,
      content: content,
      actions: const [Icon(Icons.done)],
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      elevation: 4,
      shadowColor: bgColor?.shade100 ?? Colors.redAccent.shade100,
      overflowAlignment: OverflowBarAlignment.center,
    );
    //show material banner
    ScaffoldMessenger.of(context).showMaterialBanner(materialBanner);
    //clear the banner after 3 seconds
    Timer(const Duration(seconds: 3), () {
      ScaffoldMessenger.of(context).clearMaterialBanners();
    });
  }
}