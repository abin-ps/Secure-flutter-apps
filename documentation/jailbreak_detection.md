# JailBreak Detection and Working with Device information

## Dependencies:  

```yaml
flutter_jailbreak_detection: ^1.10.0 # jailbreak detection
flutter_exit_app: ^1.1.2 # used in jailbreak detection example to exit app if jailbroken
device_info_plus: ^10.1.0 # to display device information
```

## Exit app if running on jail broken device:

##### `jailbreak_detection.dart`
```dart
import 'package:flutter_exit_app/flutter_exit_app.dart';
import 'package:flutter_jailbreak_detection/flutter_jailbreak_detection.dart';

class JailBreakDetection {
	Future<void> checkForJailBroken() async {
		bool jailBroken = await FlutterJailbreakDetection.jailbroken;
		if (jailBroken) {
			FlutterExitApp.exitApp(iosForceExit: true);
		}
	} 

	Future<bool> isJailBroken() async {
		bool jailBroken = await FlutterJailbreakDetection.jailbroken;
		return jailBroken;
	}

}
```

##### `main.dart`
```dart
Future<void> main() async {
	await JailBreakDetection().checkForJailBroken(); //this will exit the app if it is jail broken device
	runApp(const MyApp());
}
```

## Working With Device Information

##### `device_info.dart`
```dart
import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfo {
	//device info plugin instance
	final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();
	get() async {
		final AndroidDeviceInfo _androidDeviceInfo = await _deviceInfo.androidInfo;
		return '''
			board: ${_androidDeviceInfo.board} \n

			<------------------------END---------------------------->\n\n

			bootloader: ${_androidDeviceInfo.bootloader} \n

			<------------------------END---------------------------->\n\n

			brand: ${_androidDeviceInfo.brand} \n

			<------------------------END---------------------------->\n\n

			device: ${_androidDeviceInfo.device} \n

			<------------------------END---------------------------->\n\n

			display: ${_androidDeviceInfo.display} \n

			<------------------------END---------------------------->\n\n

			fingerprint: ${_androidDeviceInfo.fingerprint} \n

			<------------------------END---------------------------->\n\n

			hardware: ${_androidDeviceInfo.hardware} \n

			<------------------------END---------------------------->\n\n

			host: ${_androidDeviceInfo.host} \n

			<------------------------END---------------------------->\n\n

			id: ${_androidDeviceInfo.id} \n

			<------------------------END---------------------------->\n\n

			isLowRamDevice: ${_androidDeviceInfo.isLowRamDevice} \n

			<------------------------END---------------------------->\n\n

			isPhysicalDevice: ${_androidDeviceInfo.isPhysicalDevice} \n

			<------------------------END---------------------------->\n\n

			manufacturer: ${_androidDeviceInfo.manufacturer} \n

			<------------------------END---------------------------->\n\n

			model: ${_androidDeviceInfo.model} \n

			<------------------------END---------------------------->\n\n

			product: ${_androidDeviceInfo.product} \n

			<------------------------END---------------------------->\n\n

			serialNumber: ${_androidDeviceInfo.serialNumber} \n

			<------------------------END---------------------------->\n\n

			supported32BitAbis: ${_androidDeviceInfo.supported32BitAbis} \n

			<------------------------END---------------------------->\n\n

			supported64BitAbis: ${_androidDeviceInfo.supported64BitAbis} \n

			<------------------------END---------------------------->\n\n

			supportedAbis: ${_androidDeviceInfo.supportedAbis} \n

			<------------------------END---------------------------->\n\n

			systemFeatures: ${_androidDeviceInfo.systemFeatures} \n

			<------------------------END---------------------------->\n\n

			tags: ${_androidDeviceInfo.tags} \n

			<------------------------END---------------------------->\n\n

			type: ${_androidDeviceInfo.type} \n

			<------------------------END---------------------------->\n\n

			version: ${_androidDeviceInfo.version} \n

			data: ${_androidDeviceInfo.data} \n
		''';
	}
}
```


## Reference:
- + [Example App](/lib/examples/jail_break_detection/jail_broken_example.dart)
- [flutter jailbreak detection package reference](https://pub.dev/packages/flutter_jailbreak_detection)
- [flutter exit app package reference](https://pub.dev/packages/flutter_exit_app)
- [device info plus flutter jailbreak detection package reference](https://pub.dev/packages/device_info_plus)
